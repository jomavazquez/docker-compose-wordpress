vcl 4.1;

backend default {
    .host = "nginx";
    .port = "8080";
}

sub vcl_deliver {

    # Display hit/miss info
    if( obj.hits > 0 ){
        set resp.http.X-Cache = "HIT";
    }
  
    set resp.http.Access-Control-Allow-Origin = "*";
    set resp.http.Access-Control-Allow-Headers = "Accept, Origin, Content-Type, Keep-Alive, User-Agent, X-Requested-With, X-CSRF-Token";
    set resp.http.Allow = "GET, POST";
    set resp.http.Access-Control-Allow-Credentials = "false";
    set resp.http.Access-Control-Allow-Methods = "GET, OPTIONS";
    set resp.http.Access-Control-Expose-Headers = "X-Pagination-Total, X-Pagination-Page, X-Pagination-Limit";
}

sub vcl_backend_response {
    if( beresp.status == 200 ){
        set beresp.http.Cache-Control = "public; max-age=200";
        set beresp.ttl = 200s;
    }
    unset beresp.http.X-Powered-By;
    unset beresp.http.X-Pingback;
    unset beresp.http.Server;
    unset beresp.http.Link;

    set beresp.http.Served-By = "Jose Maria Vazquez";
    set beresp.http.V-Cache-TTL = beresp.ttl;
    set beresp.http.V-Cache-Grace = beresp.grace;
}