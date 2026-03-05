package main

// The objective is to create daily reports on the state of the blood donation platform, including metrics such as:
// - Number of donation centers
// - Number of donation campaigns
// - Number of users
// - Number of appointments scheduled
//
// The reports are generated in PDF format and stored in `reports` directory.
// The generation of reports is scheduled to run daily at midnight using a cron job.

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"time"

	"codeberg.org/go-pdf/fpdf"
	_ "github.com/lib/pq"
	cron "github.com/robfig/cron/v3"
)

func main() {
	cronPattern, exists := os.LookupEnv("CRON_PATTERN")
	if !exists {
		log.Println("CRON_PATTERN not set, defaulting to '0 13 * * *' (daily at 13:00)")
		cronPattern = "0 13 * * *" // Default to running at 13:00 daily
	}

	dsn, ok := os.LookupEnv("DATABASE_URL")
	if !ok || dsn == "" {
		log.Println("Falling back to default connection string")
		dsn = "postgres://minhtriet:blood_platform@localhost:5432/blood_platform?sslmode=disable"
	}

	db, err := sql.Open("postgres", dsn)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	if err := os.MkdirAll("reports", 0755); err != nil {
		log.Fatal(err)
	}

	log.Println("Starting scheduled analytics cron job...")
	c := cron.New()
	c.AddFunc(cronPattern, func() {
		generateReport(db)
	})
	c.Start()

	select {}
}

type reportData struct {
	donationCenters   int
	donationCampaigns int
	users             int
	appointments      int
}

func generateReport(db *sql.DB) {
	data, err := fetchReportData(db)
	if err != nil {
		log.Println("Error fetching report data:", err)
		return
	}

	pdf := createReportPDF(data)

	if err := saveReportToFile(pdf); err != nil {
		log.Println("Error generating PDF report:", err)
		return
	}

	log.Println("Report generated successfully")
}

func fetchReportData(db *sql.DB) (reportData, error) {
	var data reportData

	if err := db.QueryRow("SELECT COUNT(*) FROM donation_centres").Scan(&data.donationCenters); err != nil {
		return data, fmt.Errorf("donation centers: %w", err)
	}

	if err := db.QueryRow("SELECT COUNT(*) FROM donation_campaigns").Scan(&data.donationCampaigns); err != nil {
		return data, fmt.Errorf("donation campaigns: %w", err)
	}

	if err := db.QueryRow("SELECT COUNT(*) FROM users").Scan(&data.users); err != nil {
		return data, fmt.Errorf("users: %w", err)
	}

	if err := db.QueryRow("SELECT COUNT(*) FROM appointments").Scan(&data.appointments); err != nil {
		return data, fmt.Errorf("appointments: %w", err)
	}

	return data, nil
}

func createReportPDF(data reportData) *fpdf.Fpdf {
	pdf := fpdf.New("P", "mm", "A4", "")
	pdf.AddPage()
	pdf.SetFont("Arial", "B", 16)
	pdf.Cell(40, 10, "Daily Report")
	pdf.Ln(20)

	pdf.SetFont("Arial", "", 12)
	pdf.Cell(40, 10, "Number of Donation Centers: "+fmt.Sprint(data.donationCenters))
	pdf.Ln(10)
	pdf.Cell(40, 10, "Number of Donation Campaigns: "+fmt.Sprint(data.donationCampaigns))
	pdf.Ln(10)
	pdf.Cell(40, 10, "Number of Users: "+fmt.Sprint(data.users))
	pdf.Ln(10)
	pdf.Cell(40, 10, "Number of Appointments: "+fmt.Sprint(data.appointments))

	return pdf
}

func saveReportToFile(pdf *fpdf.Fpdf) error {
	reportPath := "reports/daily_" + time.Now().Format("2006-01-02") + ".pdf"
	if err := pdf.OutputFileAndClose(reportPath); err != nil {
		return fmt.Errorf("save report to %s: %w", reportPath, err)
	}

	log.Println("Report generated successfully at", reportPath)
	return nil
}
