%w(rubygems sinatra).each {|l| require l}
load "./lib/haml/lib/haml.rb"

configure :production do
end

get "/" do
 @magic = 1234567890
 haml :index, :layout => !request.xhr? ? :layout : false
end
use_in_file_templates!
__END__
@@ layout
!!!Strict
%html
  %head
    %title= "Is UNIX time >= #{@magic}?"
    %style * {font-family: 'Lucida Grande', Helvetica, sans-serif;padding:10px;margin:0px;text-align:center;} h2 {font-size:300px;}
    %script{:src=>"http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"}
    %script $(getTime); function getTime() { $("body").load("/");setTimeout(getTime,1000);};
    %script
      var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
      document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    %script
      try {
      var pageTracker = _gat._getTracker("UA-658908-9");
      pageTracker._trackPageview();
      } catch(err) {}
  %body
    = yield
@@ index
%h1= "Is UNIX time >= #{@magic}?"
%div#time
  %h2= (Time.now.to_i >= @magic) ? "YES" : "NO"
  -if !(Time.now.to_i >= @magic)
    %h3= "~#{@magic - Time.now.to_i} seconds 'til #{@magic}"

