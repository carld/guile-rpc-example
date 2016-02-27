(use-modules (srfi srfi-1))
(use-modules (rpc xdr)
             (rpc xdr types))
(use-modules (rpc rpc))
(use-modules (rpc rpc server))

(load "types.scm")
(load "server.scm")
(load "split-number-handler.scm")

(define my-rpc-program
  (make-ARITHMETIC-PROGRAM-server
    `(("ARITHMETIC_VERSION"  ;; specify the target version

        ;; list all supported RPCs for this version
        ("split_number" . ,split-number-handler)))))

;; Creating a listening TCP socket.
(define server-socket (socket PF_INET SOCK_STREAM 0))

;; Listen for connections on 127.0.0.1, port 6666.
(bind server-socket AF_INET INADDR_LOOPBACK 6666)
(listen server-socket 1024)

;; Go ahead and serve requests.
(run-stream-rpc-server (list (cons server-socket my-rpc-program))
                       1000000 ;; a one-second timeout
                       #f      ;; we don't care about closed connections
                       (lambda () ;; our idle thunk
                         (format #t "one second passed~%")))

