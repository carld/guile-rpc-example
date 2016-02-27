(use-modules (rpc rpc))
(use-modules (rpc xdr)
             (rpc xdr types))

(load "types.scm")
(load "client.scm")

(define socket (socket PF_INET SOCK_STREAM 0))
(connect socket AF_INET INADDR_LOOPBACK 6666)

(let ((r (ARITHMETIC-PROGRAM-split-number 3.14 #x7777 socket)))
  (simple-format #t "~S" r)
  (newline))

