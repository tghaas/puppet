include ntp
include java
include ldap



  download {
      "/tmp/httpd.tar.gz":
          uri => "http://www.webhostingjams.com/mirror/apache//httpd/httpd-2.2.29.tar.gz",
          timeout => 900;
}