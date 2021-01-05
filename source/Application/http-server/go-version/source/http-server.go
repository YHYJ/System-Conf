/* File: http-server.go */
/* Auther: YJ */
/* Email: yj1516268@outlook.com */
/* Created Time: 2021-01-05 18:15:50 */

// Description:

package main

import (
	"log"
	"net/http"
)

func main() {
	log.Println("静态服务已启动:9090")
	http.Handle("/", http.FileServer(http.Dir("./")))
	http.ListenAndServe(":9090", nil)
}
