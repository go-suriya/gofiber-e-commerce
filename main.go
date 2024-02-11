package main

import (
	"fmt"
	"os"

	"github.com/go-onesixeight/gofiber-e-commerce/config"
	"github.com/go-onesixeight/gofiber-e-commerce/modules/servers"
	"github.com/go-onesixeight/gofiber-e-commerce/pkg/databases"
)

func envPath() string {
	if len(os.Args) == 1 {
		return ".env"
	} else {
		return os.Args[1]
	}
}

func main() {
	cfg := config.LoadConfig(envPath())
	fmt.Println("cfg", cfg.App())

	db := databases.DbConnect(cfg.Db())
	defer db.Close()

	servers.NewServer(cfg, db).Start()
}
