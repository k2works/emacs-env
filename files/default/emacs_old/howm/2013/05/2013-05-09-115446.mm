<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node text="&#x30a4;&#x30f3;&#x30d5;&#x30e9;&#x74b0;&#x5883;&#x306e;&#x69cb;&#x7bc9;">
<node text="&#x30cf;&#x30fc;&#x30c9;&#x30a6;&#x30a7;&#x30a2;" folded="true" position="left">
<node text="AWS&#x74b0;&#x5883;&#x306e;&#x69cb;&#x7bc9;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ EC2&#x30a4;&#x30f3;&#x30b9;&#x30bf;&#x30f3;&#x30b9;&#x4f5c;&#x6210;<br />+ EBS&#x306e;&#x4f5c;&#x6210;<br />&#160;&#160;$ yum install xfsprogs.x86_64<br />&#160;&#160;$ mkfs.xfs /dev/xvdj<br />&#160;&#160;$ mount -t xfs -o defaults /dev/xvdj /var/git<br />+ Elastic IP&#x306e;&#x5272;&#x5f53;<br />+ Route53&#x3067;&#x30db;&#x30b9;&#x30c8;&#x540d;&#x306e;&#x5272;&#x5f53;<br />+ RDS&#x30a4;&#x30f3;&#x30b9;&#x30bf;&#x30f3;&#x30b9;&#x306e;&#x4f5c;&#x6210;<br />&#160;&#160;&#160;&#160;- RDS&#x30bb;&#x30c3;&#x30c8;&#x30a2;&#x30c3;&#x30d7;<br />&#160;&#160;&#160;&#160;&#160;&#160;$ rds-create-db-security-group development --db-security-group-description 'this RDS is development environments'<br />&#160;&#160;&#160;&#160;&#160;&#160;$ rds-authorize-db-security-group-ingress development --cidr-ip 0.0.0.0/0<br />&#160;&#160;&#160;&#160;&#160;&#160;$ rds-authorize-db-security-group-ingress development --ec2-security-group-name web --ec2-security-group-owner-id 262470114399</p><p>&#160;&#160;&#160;&#160;&#160;&#160;$ rds-create-db-instance development --engine MySQL --engine-version 5.5.27 --db-instance-class db.t1.micro --allocated-storage 5 --master-username dev --master-user-password dev123 --db-security-groups production --backup-retention-period 3<br />&#160;&#160;&#160;&#160;&#160;&#160;$ rds-create-db-parameter-group development -f mysql5.5 -d &quot;DB Parameter Group for utf8&quot;<br />&#160;&#160;&#160;&#160;&#160;&#160;$ rds-modify-db-parameter-group development -p &quot;name=character_set_client, value=utf8, method=immediate&quot;<br />&#160;&#160;&#160;&#160;&#160;&#160;$ rds-modify-db-parameter-group development -p &quot;name=character_set_connection, value=utf8, method=immediate&quot;<br />&#160;&#160;&#160;&#160;&#160;&#160;$ rds-modify-db-parameter-group development -p &quot;name=character_set_database, value=utf8, method=immediate&quot;<br />&#160;&#160;&#160;&#160;&#160;&#160;$ rds-modify-db-parameter-group development -p &quot;name=character_set_results, value=utf8, method=immediate&quot;<br />&#160;&#160;&#160;&#160;&#160;&#160;$ rds-modify-db-parameter-group development -p &quot;name=character_set_server, value=utf8, method=immediate&quot;</p><p>&#160;&#160;&#160;&#160;&#160;&#160;RDS&#x30a4;&#x30f3;&#x30b9;&#x30bf;&#x30f3;&#x30b9;&#x306e;DB Parameter Group&#x3092;development&#x306b;&#x66f4;&#x65b0;</p></body>
</html>
</richcontent>
</node>
</node>
</node>
<node text="&#x30bd;&#x30d5;&#x30c8;&#x30a6;&#x30a7;&#x30a2;(Cent OS 6.3&#x7de8;)">
<node text="OS&#x306e;&#x8a2d;&#x5b9a;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ &#x4e00;&#x822c;&#x30e6;&#x30fc;&#x30b6;&#x30fc;&#x306e;&#x4f5c;&#x6210;<br />&#160;&#160;$ useradd -m cent<br />&#160;&#160;$ passwd cent<br />&#160;&#160;$ /usr/sbin/visudo<br />&#160;&#160;&#160;# %wheel ALL=(ALL) ALL<br />&#160;&#160;&#160;#&#x3092;&#x3068;&#x308b;<br />&#160;&#160;$ gpasswd -a cent wheel<br />+ ssh&#x30ed;&#x30b0;&#x30a4;&#x30f3;&#x8a2d;&#x5b9a;<br />+ &#x8d77;&#x52d5;&#x30b9;&#x30af;&#x30ea;&#x30d7;&#x30c8;&#x306e;&#x8ffd;&#x52a0;<br />&#160;&#160;- .ec2&#x30c7;&#x30a3;&#x30ec;&#x30af;&#x30c8;&#x30ea;&#x306e;&#x4f5c;&#x6210;<br />&#160;&#160;- &#x8a8d;&#x8a3c;&#x30d5;&#x30a1;&#x30a4;&#x30eb;&#x306e;&#x30b3;&#x30d4;&#x30fc;<br />&#160;&#160;- ec2-api-tools&#x306e;&#x30b3;&#x30d4;&#x30fc;<br />&#160;&#160;- perl&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;&#160;&#160;&#160;yum install perl<br />&#160;&#160;- jdk&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;&#160;&#160;&#160;yum list \*java-1\* | grep open<br />&#160;&#160;&#160;&#160;yum install java-1.7.0-openjdk.x86_64<br />&#160;&#160;- &#x8d77;&#x52d5;&#x6642;&#x306b;&#x5b9f;&#x884c;&#x3059;&#x308b;&#x3088;&#x3046;&#x306b;&#x3059;&#x308b;<br />&#160;&#160;&#160;&#160;/etc/init.d/ec2<br />&#160;&#160;&#160;&#160;$ chkconfig --add ec2<br />&#160;&#160;&#160;&#160;$ chkconfig ec2 on<br />&#x8d77;&#x52d5;&#x30b9;&#x30af;&#x30ea;&#x30d7;&#x30c8;&#x3092;&#x5b9f;&#x884c;&#x3057;&#x3066;EBS&#x30d0;&#x30c3;&#x30af;&#x30a2;&#x30c3;&#x30d7;&#x3092;&#x3068;&#x308b;&#x3068;&#x30ed;&#x30b0;&#x30a4;&#x30f3;&#x3067;&#x304d;&#x306a;&#x304f;&#x306a;&#x308b;</p></body>
</html>
</richcontent>
</node>
</node>
<node text="&#x30df;&#x30c9;&#x30eb;&#x30a6;&#x30a7;&#x30a2;&#x306e;&#x8a2d;&#x5b9a;" folded="true">
<node text="RDMS&#x306e;&#x69cb;&#x7bc9;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ MySQL&#x30b5;&#x30fc;&#x30d0;&#x306e;&#x30bb;&#x30c3;&#x30c8;&#x30a2;&#x30c3;&#x30d7;<br />&#160;&#160;$ sudo yum install expect<br />&#160;&#160;$ mkpasswd<br />&#160;&#160;&#x30d1;&#x30b9;&#x30ef;&#x30fc;&#x30c9;<br />&#160;&#160;mzH6bS1x- (hcoss_product)<br />&#160;&#160;55Hmh0;ks (hcoss_development)<br />&#160;&#160;% sudo -s<br />&#160;&#160;% echo &quot;mzH6bS1x-&quot; &gt; /root/mysql_hcoss_product_password<br />&#160;&#160;% echo &quot;55Hmh0;ks&quot; &gt; /root/mysql_hcoss_development_password<br />&#160;&#160;% chmod 400 /root/mysql_*_password<br />&#160;&#160;% exit<br />+ &#x63a5;&#x7d9a;&#x306e;&#x78ba;&#x8a8d;<br />&#160;&#160;mysql -h development.ccebcwxdebti.ap-northeast-1.rds.amazonaws.com -P 3306 -u dev -p<br />&#160;&#160;Enter password:dev123<br />&#160;&#160;&#x30d1;&#x30b9;&#x30ef;&#x30fc;&#x30c9;&#x306e;&#x5909;&#x66f4;&#x306f;AWS&#x30b3;&#x30f3;&#x30bd;&#x30fc;&#x30eb;&#x304b;&#x3089;&#x5b9f;&#x884c;&#x3059;&#x308b;<br />&#160;&#160;mysql -h development.ccebcwxdebti.ap-northeast-1.rds.amazonaws.com -P 3306 -u dev -p<br />&#160;&#160;Enter password:55Hmh0;ks</p></body>
</html>
</richcontent>
</node>
</node>
<node text="&#x30d7;&#x30ed;&#x30b8;&#x30a7;&#x30af;&#x30c8;&#x7ba1;&#x7406;&#x30c4;&#x30fc;&#x30eb;&#x306e;&#x69cb;&#x7bc9;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ Aluminium&#x304c;&#x4fdd;&#x5b58;&#x3055;&#x308c;&#x308b;&#x30c7;&#x30a3;&#x30ec;&#x30af;&#x30c8;&#x30ea;&#x3092;&#x30de;&#x30a6;&#x30f3;&#x30c8;&#x3059;&#x308b;<br />&#160;&#160;/var/opt/alminium/  <br />&#x30a2;&#x30af;&#x30bb;&#x30b9;&#x304c;&#x3067;&#x304d;&#x306a;&#x304f;&#x306a;&#x308b;&#x306e;&#x3067;&#x3084;&#x3081;&#x308b;       <br />+ Aluminum&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;$ yum install git <br />&#160;$ git clone https://github.com/alminium/alminium.git<br />&#160;$ cd alminium<br />&#160;$ bash ./smelt<br />+ &#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;&#x5f8c;&#x306b;apache&#x304c;&#x8d77;&#x52d5;&#x3057;&#x306a;&#x3044;&#x5834;&#x5408;<br />&#160;$ sudo service httpd start<br />&#160;Starting httpd: httpd: Syntax error on line 221 of /etc/httpd/conf/httpd.conf: Syntax error on line 1 of /etc/httpd/conf.d/redmine.conf: Cannot load /usr/lib64/ruby/gems/1.9.1/gems/passenger-4.0.2/ext/apache2/mod_passenger.so into server: /usr/lib64/ruby/gems/1.9.1/gems/passenger-4.0.2/ext/apache2/mod_passenger.so: cannot open shared object file: No such file or directory<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;[FAILED]<br />&#160;$ sudo find / -type f -name mod_passenger.so<br />&#160;$ sudo cp /usr/lib64/ruby/gems/1.9.1/gems/passenger-4.0.2/libout/apache2/mod_passenger.so /usr/lib64/ruby/gems/1.9.1/gems/passenger-4.0.2/ext/apache2/<br />+ &#x30d7;&#x30ed;&#x30b8;&#x30a7;&#x30af;&#x30c8;&#x306e;&#x767b;&#x9332;<br />&#160;$ git config --global http.sslverify false<br />&#160;$ git clone https://dev.k2-works.net/git/hcoss<br />&#160;&#160;&#x3053;&#x3053;&#x3067;&#x805e;&#x304b;&#x308c;&#x308b;&#x30d1;&#x30b9;&#x30ef;&#x30fc;&#x30c9;&#x306f;alminum&#x3067;&#x767b;&#x9332;&#x3057;&#x305f;&#x60c5;&#x5831;&#xff08;&#x30b5;&#x30fc;&#x30d0;OS&#x306e;&#x30e6;&#x30fc;&#x30b6;&#x3067;&#x306f;&#x306a;&#x3044;&#xff09;</p></body>
</html>
</richcontent>
</node>
</node>
<node text="SCM&#x306e;&#x69cb;&#x7bc9;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ Git&#x30e6;&#x30fc;&#x30b6;&#x30fc;&#x306e;&#x4f5c;&#x6210;         <br />&#160;&#x307e;&#x305a;&#x30ea;&#x30e2;&#x30fc;&#x30c8;&#x30de;&#x30b7;&#x30f3;&#x306b;git&#x30e6;&#x30fc;&#x30b6;&#x30fc;&#x3092;&#x4f5c;&#x6210;&#x3057;&#x307e;&#x3059;&#x3002;</p><p>&#160;$ sudo useradd -m -d /var/git git<br />&#160;$ sudo passwd git<br />&#160;$ sudo chmod 750 /var/git<br />&#160;$ sudo gpasswd -a git apache      <br />+ Git&#x30ec;&#x30dd;&#x30b8;&#x30c8;&#x30ea;&#x306e;&#x8a2d;&#x5b9a;       <br />&#160;&#x30ed;&#x30fc;&#x30ab;&#x30eb;&#x30de;&#x30b7;&#x30f3;&#x304b;&#x3089;&#x3042;&#x306a;&#x305f;&#x306e;SSH&#x516c;&#x958b;&#x9375;&#x3092;git&#x30e6;&#x30fc;&#x30b6;&#x30fc;&#x306e;&#x30db;&#x30fc;&#x30e0;&#x30c7;&#x30a3;&#x30ec;&#x30af;&#x30c8;&#x30ea;&#x306b;&#x8ee2;&#x9001;&#x3057;&#x307e;&#x3059;&#x3002;<br />&#160;$ scp -i k2works.pem ~/.ssh/id_rsa.pub git@dev.k2-works.net:~</p><p>&#160;SSH&#x516c;&#x958b;&#x9375;&#x3092;authorized_keys&#x306b;&#x52a0;&#x3048;&#x307e;&#x3059;&#x3002;<br />&#160;$ cat id_rsa.pub &gt;&gt; .ssh/authorized_keys<br />&#160;$ rm id_rsa.pub</p><p>&#160;$ sudo mkdir --mode=700 /var/git/.ssh<br />&#160;$ sudo cp .ssh/authorized_keys /var/git/.ssh/<br />&#160;$ sudo chown -R git:git /var/git/.ssh</p><p>&#160;&#x30ed;&#x30fc;&#x30ab;&#x30eb;&#x30de;&#x30b7;&#x30f3;&#x304b;&#x3089;rails&#x30e6;&#x30fc;&#x30b6;&#x30fc;&#x3068;&#x3057;&#x3066;SSH&#x3067;&#x63a5;&#x7d9a;&#x3057;&#x3001;&#x30d1;&#x30b9;&#x30ef;&#x30fc;&#x30c9;&#x3092;&#x5c0b;&#x306d;&#x3089;&#x308c;&#x306a;&#x3044;&#x3053;&#x3068;&#x3092;&#x78ba;&#x8a8d;&#x3057;&#x307e;&#x3059;&#x3002;<br />&#160;% ssh git@dev.k2-works.net</p><p>&#160;&#x30ea;&#x30dd;&#x30b8;&#x30c8;&#x30ea;&#x3078;&#x306e;&#x30b7;&#x30f3;&#x30dc;&#x30eb;&#x30ea;&#x30f3;&#x30af;&#x3092;&#x4f5c;&#x6210;&#x3059;&#x308b;<br />&#160;$ ln -s /var/opt/alminium/git/hcoss/ hcoss.git</p></body>
</html>
</richcontent>
</node>
</node>
<node text="CI&#x30b5;&#x30fc;&#x30d0;&#x306e;&#x69cb;&#x7bc9;" folded="true">
<node text="&#x81ea;&#x52d5;&#x30c6;&#x30b9;&#x30c8;" folded="true">
<node text="Rails&#x30d7;&#x30ed;&#x30b8;&#x30a7;&#x30af;&#x30c8;&#x306e;&#x4f5c;&#x6210;" folded="true">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ node.js&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;&#160;<a href="http://takatamajp.wordpress.com/2012/11/17/install_nodejs_on_mac_os_x_using_homebrew/">Mac OS X &#x3068; homebrew &#x306a;&#x3089;&#x9a5a;&#x304f;&#x307b;&#x3069;&#x7c21;&#x5358;&#x306b; node.js &#x3067; HelloWorld</a><br />&#160;&#160;$ruby -e &quot;$(curl -fsSkL raw.github.com/mxcl/homebrew/go)&quot;<br />&#160;&#160;$brew install node<br />+ Rails&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;     <br />+ RSpec&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;&#160;<a href="http://qiita.com/items/bf1bc376d88186050f3f">&#x3053;&#x308c;&#x304b;&#x3089;&#x30c6;&#x30b9;&#x30c8;&#x3092;&#x66f8;&#x304d;&#x59cb;&#x3081;&#x305f;&#x3044;&#x4eba;&#x306e;&#x305f;&#x3081;&#x306e; Rails+RSpec+Spork+FactoryGirl &#x30c1;&#x30e5;&#x30fc;&#x30c8;&#x30ea;&#x30a2;&#x30eb;</a><br />&#160;&#160;Gemfile<br />&#160;&#160;group :test, :development do<br />&#160;&#160;&#160;&#160;gem 'rspec-rails', '~&gt;2.0'<br />&#160;&#160;end<br />&#160;&#160;$bundle install<br />&#160;&#160;$rails generate rspec:install<br />&#160;&#160;$rake db:create<br />&#160;&#160;$rake db:migrate<br />&#160;&#160;$rake spec</p><p>&#160;&#160;.rspec&#x3092;&#x76f4;&#x4e0b;&#x306b;&#x4f5c;&#x6210;&#x3059;&#x308b;<br />&#160;&#160;--color<br />+ Cucumber&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;&#160;Gemfile<br />&#160;&#160;group :test, :development do<br />&#160;&#160;&#160;&#160;gem 'rspec-rails', '~&gt;2.0'<br />&#160;&#160;&#160;&#160;gem 'cucumber-rails&quot;<br />&#160;&#160;end     <br />&#160;&#160;$bundle install<br />&#160;&#160;$rails generate cucumber:install<br />&#160;&#160;$rake db:migrate<br />&#160;&#160;$rake db:test:prepare<br />&#160;&#160;$rake spec<br />&#160;&#160;$rake cucumber</p></body>
</html>
</richcontent>
</node>
<node text="Capybara-webkit&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ QT&#x30e9;&#x30a4;&#x30d6;&#x30e9;&#x30ea;&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;&#160;<a href="http://www.oiax.jp/rails/zakkan/testing_javascript_with_rspec_and_capybara.html">RSpec&#x3068;Capybara&#x3067;JavaScript/Ajax&#x3092;&#x30c6;&#x30b9;&#x30c8;&#x3059;&#x308b;</a>     <br />&#160;&#160;$brew install qt<br />+ Capybara-webkit&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;&#160;Mac&#x74b0;&#x5883;&#x3067;&#x306f;headless&#x306f;&#x3044;&#x3089;&#x306a;&#x3044;<br />&#160;&#160;&#x30b5;&#x30fc;&#x30d0;&#x30fc;&#x306b;&#x306f;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;&#x3059;&#x308b;&#x3053;&#x3068;<br />&#160;-  CentOS6.3&#x306e;&#x5834;&#x5408;<br />&#160;&#160;&#160;&#160;<a href="https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit">Installing Qt and compiling capybara webkit</a><br />&#160;&#160;&#160;&#160;<a href="http://tomykaira.hatenablog.com/entry/2012/07/27/103122">CentOS6.3 &#x306e; Jenkins &#x4e0a;&#x3067; jasmine-headless-webkit &#x3092;&#x8d70;&#x3089;&#x305b;&#x308b;</a></p><p>&#160;&#160;&#160;&#160;rpm -i <a href="http://dl.atrpms.net/el6-x86_64/atrpms/stable/atrpms-repo-6-6.el6.x86_64.rpm">http://dl.atrpms.net/el6-x86_64/atrpms/stable/atrpms-repo-6-6.el6.x86_64.rpm</a><br />&#160;&#160;&#160;&#160;yum install --enablerepo=atrpms-testing qt47-webkit-devel<br />&#160;&#160;&#160;&#160;export QMAKE=/usr/bin/qmake-qt47</p><p>&#160;&#160;&#160;&#160;cd /usr/bin<br />&#160;&#160;&#160;&#160;sudo ln -s qmake-qt47 qmake<br />&#160;&#160;&#160;&#160;sudo ln -s qmake-qt47 qmake-qt4</p><p>group :test, :development do<br />&#160;&#160;gem 'rspec-rails','~&gt;2.0'<br />&#160;&#160;gem 'database_cleaner'<br />end <br />group :test do<br />&#160;&#160;gem 'headless'<br />&#160;&#160;gem 'capybara-webkit'<br />end </p><p>$bundle install</p><p>spec/spec_helper.rb</p><p>config.before(:suite) do<br />&#160;&#160;DatabaseCleaner.strategy = :truncation<br />&#160;&#160;DatabaseCleaner.clean_with(:truncation)<br />end</p><p>config.before(:each) do<br />&#160;DatabaseCleaner.start<br />end</p><p>config.after(:each) do<br />&#160;DatabaseCleaner.clean<br />end</p><p>Capybara.javascript_driver = :webkit</p><p>$ rake spec</p></body>
</html>
</richcontent>
</node>
</node>
<node text="&#x30c6;&#x30b9;&#x30c8;&#x30b5;&#x30fc;&#x30d0;&#x30fc;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ Sport<br />&#160;&#160;<a href="http://qiita.com/items/fbe0a4ac2269a743dc17">&#x3053;&#x308c;&#x304b;&#x3089;&#x30c6;&#x30b9;&#x30c8;&#x3092;&#x66f8;&#x304d;&#x59cb;&#x3081;&#x305f;&#x3044;&#x4eba;&#x306e;&#x305f;&#x3081;&#x306e; Rails+RSpec+Spork+FactoryGirl &#x30c1;&#x30e5;&#x30fc;&#x30c8;&#x30ea;&#x30a2;&#x30eb;&#xff08;&#x305d;&#x306e;&#xff12;&#xff09;</a><br />&#160;&#160;$ vim Gemfile<br />&#160;&#160;Gemfile<br />&#160;&#160;group :test, :development do<br />&#160;&#160;&#160;&#160;gem 'rspec-rails','~&gt;2.0'<br />&#160;&#160;&#160;&#160;gem 'database_cleaner'<br />&#160;&#160;&#160;&#160;gem 'spork','0.9.2'<br />&#160;&#160;end  </p><p>&#160;&#160;spork --bootstrap<br />&#160;&#160;$ vim spec/spec_helper.rb<br />&#160;&#160;&#x4e00;&#x901a;&#x308a;Spork.prefork do&#x30fb;&#x30fb;&#x30fb;end&#x306b;&#x5165;&#x308c;&#x308b;<br />&#160;&#160;&#160;&#160;require 'rubygems'<br />&#160;&#160;require 'spork'<br />&#160;&#160;#uncomment the following line to use spork with the debugger<br />&#160;&#160;#require 'spork/ext/ruby-debug'</p><p>&#160;&#160;Spork.prefork do<br />&#160;&#160;# Loading more in this block will cause your tests to run faster. However,<br />&#160;&#160;# if you change any configuration or code from libraries loaded here, you'll<br />&#160;&#160;# need to restart spork for it take effect.</p><p>&#160;&#160;# This file is copied to spec/ when you run 'rails generate rspec:install'<br />&#160;&#160;ENV[&quot;RAILS_ENV&quot;] ||= 'test'<br />&#160;&#160;require File.expand_path(&quot;../../config/environment&quot;, __FILE__)<br />&#160;&#160;require 'rspec/rails'<br />&#160;&#160;require 'rspec/autorun'</p><p>&#160;&#160;# Requires supporting ruby files with custom matchers and macros, etc,<br />&#160;&#160;# in spec/support/ and its subdirectories.<br />&#160;&#160;Dir[Rails.root.join(&quot;spec/support/**/*.rb&quot;)].each {|f| require f}</p><p>&#160;&#160;RSpec.configure do |config|<br />&#160;&#160;# ## Mock Framework<br />&#160;&#160;#<br />&#160;&#160;# If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:<br />&#160;&#160;#<br />&#160;&#160;# config.mock_with :mocha<br />&#160;&#160;# config.mock_with :flexmock<br />&#160;&#160;# config.mock_with :rr</p><p>&#160;&#160;# Remove this line if you're not using ActiveRecord or ActiveRecord fixtures<br />&#160;&#160;config.fixture_path = &quot;#{::Rails.root}/spec/fixtures&quot;</p><p>&#160;&#160;# If you're not using ActiveRecord, or you'd prefer not to run each of your<br />&#160;&#160;# examples within a transaction, remove the following line or assign false<br />&#160;&#160;# instead of true.<br />&#160;&#160;config.use_transactional_fixtures = true</p><p>&#160;&#160;# If true, the base class of anonymous controllers will be inferred<br />&#160;&#160;# automatically. This will be the default behavior in future versions of<br />&#160;&#160;# rspec-rails.<br />&#160;&#160;config.infer_base_class_for_anonymous_controllers = false<br />&#160;&#160;end<br />&#160;&#160;end</p><p>&#160;&#160;Spork.each_run do<br />&#160;&#160;# This code will be run each time you run your specs.</p><p>&#160;&#160;end</p><p>&#160;&#160;$ vim .rspec<br />&#160;&#160;.rspec<br />&#160;&#160;&#160;&#160;--colour<br />&#160;&#160;&#160;&#160;--drb<br />&#160;&#160;$ spork       </p></body>
</html>
</richcontent>
</node>
</node>
<node text="jenkins&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>Jenkins Update<br /><a href="http://d.hatena.ne.jp/tadasy/20111109/1320842690">http://d.hatena.ne.jp/tadasy/20111109/1320842690</a><br /><a href="http://shogogg.hatenablog.jp/entry/20120410/1334048401">http://shogogg.hatenablog.jp/entry/20120410/1334048401</a><br />wget <a href="http://mirrors.jenkins-ci.org/war/latest/jenkins.war">http://mirrors.jenkins-ci.org/war/latest/jenkins.war</a></p><p>sudo service jenkins stop<br />sudo rm /usr/lib/jenkins/jenkins.war<br />sudo mv jenkins.war /usr/lib/jenkins/<br />sudo service jenkins start<br /></p></body>
</html>
</richcontent>
</node>
</node>
<node text="Rails&#x3092;&#x30d3;&#x30eb;&#x30c9;&#x3059;&#x308b;&#x305f;&#x3081;&#x306e;Jenkins&#x30bb;&#x30c3;&#x30c8;&#x30a2;&#x30c3;&#x30d7;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ RVM&#x306e;&#x8a2d;&#x5b9a;<br />&#160;&#160;<a href="http://blog.opensquare.jp/?p=1667">Ubuntu Server 12.04 LTS + RVM + ruby1.9 + Rails3&#x306e;&#x74b0;&#x5883;&#x3092;&#x69cb;&#x7bc9;&#x3057;&#x3066;&#x307f;&#x305f;</a><br />+ RVM&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;<a href="http://morizyun.github.io/blog/rvm-install-centos-ruby-rails/">&#x3055;&#x304f;&#x3089;VPS/CentOS 6.3 Ruby 1.93/RVM&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;&#x624b;&#x9806;Rails&#x30b5;&#x30fc;&#x30d0;&#x3078;&#x306e;&#x9053;</a><br />&#160;bash -s stable &lt; &lt;(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )<br />&#160;rvm pkg install libyaml<br />&#160;rvm remove 1.9.1    <br />&#160;rvm install ruby-1.9.3 -C --with-opt-dir=$HOME/.rvm/usr    <br />+ Git Plugin<br />+ RVM Plugin<br />+ Rake Plugin<br />+ Jenkins&#x53ca;&#x3073;&#x30d7;&#x30e9;&#x30b0;&#x30a4;&#x30f3;&#x306e;&#x8a2d;&#x5b9a;<br />&#160;&#160;- git&#x306e;&#x8a2d;&#x5b9a;<br />&#160;&#160;- Git plugin&#x306e;&#x8a2d;&#x5b9a;<br />&#160;&#160;- Rake&#x306e;&#x8a2d;&#x5b9a;&#xff08;&#x7a7a;&#x6b04;&#x306e;&#x307e;&#x307e;&#xff09;<br />&#160;&#160;- E-mail&#x901a;&#x77e5;&#x306e;&#x8a2d;&#x5b9a;</p></body>
</html>
</richcontent>
</node>
</node>
<node text="Rails&#x3092;&#x30d3;&#x30eb;&#x30c9;&#x3059;&#x308b;&#x30b8;&#x30e7;&#x30d6;&#x3092;&#x4f5c;&#x6210;&#x3059;&#x308b;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ jenkins&#x304b;&#x3089;git&#x306b;&#x30a2;&#x30af;&#x30bb;&#x30b9;&#x3067;&#x304d;&#x308b;&#x3088;&#x3046;&#x306b;&#x3059;&#x308b;<br />&#160;&#160;&#x3053;&#x306e;&#x8fba;&#x306f;&#x66d6;&#x6627;<br />&#160;&#160;$ qpasswd -a jenkins apcach<br />&#160;&#160;$ qpasswd -a jenkins git<br />&#160;&#160;&#x3067;&#x306f;&#x3001;jenkins&#x30e6;&#x30fc;&#x30b6;&#x3067;ssh&#x30ad;&#x30fc;&#x306e;&#x4f5c;&#x6210;&#x3092;&#x884c;&#x3044;&#x307e;&#x3059;<br />&#160;<a href="http://www.tokoro.me/2012/07/29/jenkins-octopress/    "> Jenkins@&#x3055;&#x304f;&#x3089;VPS&#x306b;Octopress&#x306e;&#x30c7;&#x30d7;&#x30ed;&#x30a4;&#x3092;&#x4efb;&#x305b;&#x3066;&#x307f;&#x308b;</a><br />&#160;&#160;$ cd /var/lib/jenkins<br />&#160;&#160;$ sudo -u jenkins -H /usr/bin/git config --global user.email &quot;kakimomokuri@gmail.com&quot;<br />&#160;&#160;$ sudo -u jenkins -H /usr/bin/git config --global user.name &quot;k2works&quot;<br />&#160;&#160;$ sudo -u jenkins -H ssh-keygen -t rsa -C kakimomokuri@gmail.com<br />&#160;&#160;cat /var/lib/jenkins/.ssh/id_rsa.pub &gt;&gt; /var/git/.ssh/authorized_key<br />&#160;&#160;cp .ssh/known_hosts /var/lib/jenkins/.ssh/<br />+ Rake Plugin&#x3092;&#x4f7f;&#x3063;&#x3066;&#x30d3;&#x30eb;&#x30c9;&#x3059;&#x308b;<br />+ &#x30b7;&#x30a7;&#x30eb;&#x30b9;&#x30af;&#x30ea;&#x30d7;&#x30c8;&#x3092;&#x4f7f;&#x3063;&#x3066;&#x30d3;&#x30eb;&#x30c9;&#x3059;&#x308b;<br />&#160;&#160;gem install bundle --no-ri --no-rdoc<br />&#160;&#160;bundle install<br />&#160;&#160;rake db:setup<br />&#160;&#160;rake spec</p></body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
</node>
<node text="&#x30b3;&#x30fc;&#x30c9;&#x30a4;&#x30f3;&#x30b9;&#x30da;&#x30af;&#x30b7;&#x30e7;&#x30f3;" folded="true">
<node text="&#x30b3;&#x30fc;&#x30c9;&#x30ab;&#x30d0;&#x30ec;&#x30c3;&#x30b8;&#x5206;&#x6790;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ Gem&#x3092;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;&#x3059;&#x308b;<br />&#160;&#160;group :test do<br />&#160;&#160;&#160;#&#x30ed;&#x30fc;&#x30ab;&#x30eb;&#x958b;&#x767a;&#x3067;&#x306f;&#x4f7f;&#x308f;&#x306a;&#x3044;<br />&#160;&#160;&#160;# gem 'headless'<br />&#160;&#160;&#160;gem 'capybara-webkit'<br />&#160;&#160;&#160;gem 'simplecov', :require =&gt; false<br />&#160;&#160;&#160;gem 'simplecov-rcov', :require =&gt; false<br />&#160;&#160;end<br />+ spec/spec_helpler.rb&#x306e;&#x982d;&#x306b;&#x8ffd;&#x52a0;<br />&#160;&#160;require 'simplecov'<br />&#160;&#160;require 'simplecov-rcov'<br />&#160;&#160;SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter<br />&#160;&#160;SimpleCov.start 'rails'<br />+ .gitignore&#x306b;coverage&#x8ffd;&#x52a0;<br />+ Ruby metrics plugin<br />&#160;&#160;&#x30d3;&#x30eb;&#x30c9;&#x5f8c;&#x306e;&#x51e6;&#x7406;&#x306e;&#x8ffd;&#x52a0;   </p></body>
</html>
</richcontent>
</node>
</node>
<node text="&#x30b3;&#x30fc;&#x30c9;&#x54c1;&#x8cea;&#x306e;&#x691c;&#x67fb;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ rails_best_practices&#x3092;Gem&#x306b;&#x8ffd;&#x52a0;<br />&#160;group :test, :development do<br />&#160;&#160;&#160;gem 'rspec-rails','~&gt;2.0'<br />&#160;&#160;&#160;gem 'database_cleaner'<br />&#160;&#160;&#160;gem 'spork','0.9.2'<br />&#160;&#160;&#160;gem 'rails_best_practices', :require =&gt; false<br />&#160;&#160;end     <br />+ rails_bes_practices.sh&#x8ffd;&#x52a0;<br />+ &#x30d3;&#x30eb;&#x30c9;&#x624b;&#x9806;&#x306e;&#x8ffd;&#x52a0;&#x304b;&#x3089;&#x30b7;&#x30a7;&#x30eb;&#x306e;&#x5b9f;&#x884c;&#x3092;&#x8ffd;&#x52a0;<br />&#160;&#160;bash script/rails_best_paractices.sh<br />+ Plot Plugin<br />&#160;&#160;&#x30d3;&#x30eb;&#x30c9;&#x5f8c;&#x306e;&#x51e6;&#x7406;&#x3067;&#x30d3;&#x30eb;&#x30c9;&#x30c7;&#x30fc;&#x30bf;&#x3092;&#x30d7;&#x30ed;&#x30c3;&#x30c8;&#x3092;&#x8ffd;&#x52a0;<br />+ .gitignore&#x306b;reports&#x3092;&#x8ffd;&#x52a0;</p></body>
</html>
</richcontent>
</node>
</node>
<node text="&#x91cd;&#x8907;&#x30b3;&#x30fc;&#x30c9;&#xff08;&#x30b3;&#x30d4;&#x30fc;&#xff06;&#x30da;&#x30fc;&#x30b9;&#x30c8;&#xff09;&#x306e;&#x691c;&#x51fa;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p><a href="http://blog.justoneplanet.info/2010/12/03/centos%E3%81%ABant%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%99%E3%82%8B/">CentOS&#x306b;Ant&#x3092;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;&#x3059;&#x308b;</a><br />+ pmd&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;     <br />+ sudo apt-get install ant<br />+ tools/build.xml&#x8ffd;&#x52a0;<br />+ DRY Plugin<br />&#160;&#x30d3;&#x30eb;&#x30c9;&#x624b;&#x9806;&#x306e;&#x8ffd;&#x52a0;&#x304b;&#x3089;Ant&#x306e;&#x547c;&#x3073;&#x51fa;&#x3057;&#x3092;&#x8ffd;&#x52a0;<br />&#160;&#x30d3;&#x30eb;&#x30c9;&#x5f8c;&#x306e;&#x51e6;&#x7406;&#x306b;&#x91cd;&#x8907;&#x30b3;&#x30fc;&#x30c9;&#x5206;&#x6790;&#x306e;&#x96c6;&#x8a08;&#x3092;&#x8ffd;&#x52a0;<br />+ .gitignore&#x3078;&#x306e;&#x8ffd;&#x52a0;<br />&#160;tools/pmd/doc</p></body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
<node text="&#x30c9;&#x30ad;&#x30e5;&#x30e1;&#x30f3;&#x30c8;&#x751f;&#x6210;" folded="true">
<node text="Ruby,Rails&#x3067;&#x306e;&#x30c9;&#x30ad;&#x30e5;&#x30e1;&#x30f3;&#x30c8;&#x751f;&#x6210;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ YARD&#x3092;&#x4f7f;&#x3063;&#x3066;&#x30c9;&#x30ad;&#x30e5;&#x30e1;&#x30f3;&#x30c8;&#x3092;&#x751f;&#x6210;&#x3057;&#x3001;&#x95b2;&#x89a7;&#x3067;&#x304d;&#x308b;&#x3088;&#x3046;&#x306b;&#x3059;&#x308b;<br />&#160;&#160;group :test, :development do<br />&#160;&#160;gem 'rspec-rails','~&gt;2.0'<br />&#160;&#160;gem 'database_cleaner'<br />&#160;&#160;gem 'spork','0.9.2'<br />&#160;&#160;gem 'rails_best_practices', :require =&gt; false<br />&#160;&#160;gem 'yard', :require =&gt; false<br />&#160;end        <br />+ HTML Publisher Plugin<br />&#160;&#160;&#x30d3;&#x30eb;&#x30c9;&#x624b;&#x9806;&#x306e;&#x8ffd;&#x52a0;&#x304b;&#x3089;&#x30b7;&#x30a7;&#x30eb;&#x306e;&#x5b9f;&#x884c;&#x3092;&#x9078;&#x629e;&#x3057;&#x3066; yard doc<br />&#160;&#160;&#x30d3;&#x30eb;&#x30c9;&#x5f8c;&#x306e;&#x51e6;&#x7406;&#x306e;&#x8ffd;&#x52a0;&#x304b;&#x3089;Publish HTML Reports&#x8ffd;&#x52a0;</p></body>
</html>
</richcontent>
</node>
</node>
<node text="Ruby,Rails&#x3067;&#x306e;&#x30c7;&#x30d7;&#x30ed;&#x30a4;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ &#x65b0;&#x3057;&#x3044;&#x30b8;&#x30e7;&#x30d6;&#x3092;&#x4f5c;&#x308b;blog_deploy<br />+ &#x30bd;&#x30fc;&#x30b9;&#x30b3;&#x30fc;&#x30c9;&#x7ba1;&#x7406;&#x30b7;&#x30b9;&#x30c6;&#x30e0;&#x306f;blog&#x30b8;&#x30e7;&#x30d6;&#x3068;&#x540c;&#x69d8;&#x306b;&#x8a2d;&#x5b9a;&#x3059;&#x308b;<br />+ &#x30d3;&#x30eb;&#x30c9;&#x30fb;&#x30c8;&#x30ea;&#x30ac;&#x30bb;&#x30af;&#x30b7;&#x30e7;&#x30f3;&#x5185;&#x3067;&#x4ed6;&#x306e;&#x30d7;&#x30ed;&#x30b8;&#x30a7;&#x30af;&#x30c8;&#x306e;&#x30d3;&#x30eb;&#x30c9;&#x5f8c;&#x306b;&#x30d3;&#x30eb;&#x30c9;&#x306b;&#x30c1;&#x30a7;&#x30c3;&#x30af;&#x3092;&#x5165;&#x308c;&#x308b;<br />+ Run the build in a RVM-managed environment&#x3082;blog&#x30b8;&#x30e7;&#x30d6;&#x3068;&#x540c;&#x69d8;&#x306b;&#x8a2d;&#x5b9a;&#x3057;&#x3066;&#x304a;&#x304f;<br />+ &#x30d3;&#x30eb;&#x30c9;&#x306e;&#x30bb;&#x30af;&#x30b7;&#x30e7;&#x30f3;&#x3067;&#x306f;&#x30b7;&#x30a7;&#x30eb;&#x30b9;&#x30af;&#x30ea;&#x30d7;&#x30c8;&#x306e;&#x5b9f;&#x884c;&#x3092;&#x9078;&#x3073;cap deploy&#x3092;&#x5165;&#x529b;&#x3059;&#x308b;** &#x30c7;&#x30d7;&#x30ed;&#x30a4;</p></body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
<node text="&#x5206;&#x6563;&#x30d3;&#x30eb;&#x30c9;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>+ &#x81ea;&#x52d5;&#x30c6;&#x30b9;&#x30c8;&#x3068;&#x30b3;&#x30fc;&#x30c9;&#x30a4;&#x30f3;&#x30b9;&#x30da;&#x30af;&#x30b7;&#x30e7;&#x30f3;&#x306e;&#x5206;&#x5272;<br />&#160;+ &#x81ea;&#x52d5;&#x30c6;&#x30b9;&#x30c8;&#x306e;&#x7a2e;&#x985e;&#x3067;&#x306e;&#x5206;&#x5272;<br />&#160;+ &#x30d3;&#x30eb;&#x30c9;&#x30d5;&#x30ed;&#x30fc;&#x306e;&#x8d77;&#x70b9;&#x306e;&#x8a2d;&#x5b9a;&#x3068;&#x30d5;&#x30ed;&#x30fc;&#x306b;&#x6f5c;&#x3080;&#x554f;&#x984c;&#x306e;&#x89e3;&#x6c7a;<br />&#160;&#160;&#160;Jenkins Parameterized Trigger plugin<br />&#160;&#160;&#160;Join plugin<br />&#160;&#160;&#160;Build Pipeline Plugin<br /></p></body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
<node text="&#x30a2;&#x30d7;&#x30ea;&#x30b1;&#x30fc;&#x30b7;&#x30e7;&#x30f3;&#x306e;&#x8a2d;&#x5b9a;" folded="true">
<node text="&#x30b9;&#x30c6;&#x30fc;&#x30b8;&#x30f3;&#x30b0;&#x74b0;&#x5883;&#x306e;&#x69cb;&#x7bc9;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p>- Rails&#x30a2;&#x30d7;&#x30ea;&#x30b1;&#x30fc;&#x30b7;&#x30e7;&#x30f3;&#x306e;&#x30bb;&#x30c3;&#x30c8;&#x30a2;&#x30c3;&#x30d7;    <br />&#160;&#160;+ rails&#x30e6;&#x30fc;&#x30b6;&#x30fc;&#x306e;&#x4f5c;&#x6210;<br />&#160;&#160;&#160;$ sudo useradd -m -d /var/rails rails<br />&#160;&#160;&#160;$ sudo passwd rails<br />&#160;&#160;&#160;$ sudo chmod 750 /var/rails</p><p>&#160;&#160;&#160;&#160;rails&#x30e6;&#x30fc;&#x30b6;&#x30fc;&#x3092;git&#x30b0;&#x30eb;&#x30fc;&#x30d7;&#x306b;&#x52a0;&#x3048;&#x307e;&#x3059;&#x3002;/var/opt/aluminum/git&#x30c7;&#x30a3;&#x30ec;&#x30af;&#x30c8;&#x30ea;&#x306e;&#x8aad;&#x307f;&#x53d6;&#x308a;&#x6a29;&#x9650;&#x304c;&#x4e0e;&#x3048;&#x3089;&#x308c;&#x308b;&#x3053;&#x3068;&#x306b;&#x306a;&#x308a;&#x307e;&#x3059;&#x3002;<br />&#160;&#160;&#160;&#160;&#x8aad;&#x307f;&#x53d6;&#x308a;&#x6a29;&#x9650;&#x5909;&#x66f4;&#x3092;&#x5fd8;&#x308c;&#x308b;&#x3068;web&#x304b;&#x3089;&#x30a2;&#x30af;&#x30bb;&#x30b9;&#x3067;&#x304d;&#x306a;&#x3044;&#x306e;&#x3067;&#x6ce8;&#x610f;&#xff01;<br />&#160;&#160;&#160;$ sudo gpasswd -a rails git<br />&#160;&#160;&#160;$ sudo gpasswd -a rails apache<br />&#160;&#160;+ Apache&#x5b9f;&#x884c;&#x30e6;&#x30fc;&#x30b6;&#x30fc;&#x3092;&#x30b0;&#x30eb;&#x30fc;&#x30d7;&#x306b;&#x8ffd;&#x52a0;<br />&#160;&#160;&#160;&#160;% sudo gpasswd -a apache rails<br />&#160;&#160;+ RVM&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;&#160;&#160;&#160;$ yuml install libtool<br />&#160;&#160;&#160;&#160;$ yuml install bison<br />&#160;&#160;&#160;&#160;<a href="http://morizyun.github.io/blog/rvm-install-centos-ruby-rails/">&#x3055;&#x304f;&#x3089;VPS/CentOS 6.3 Ruby 1.93/RVM&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;&#x624b;&#x9806;Rails&#x30b5;&#x30fc;&#x30d0;&#x3078;&#x306e;&#x9053;</a><br />&#160;&#160;&#160;&#160;bash -s stable &lt; &lt;(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )<br />&#160;&#160;&#160;&#160;rvm pkg install libyaml<br />&#160;&#160;&#160;&#160;rvm install ruby-1.9.3 -C --with-opt-dir=$HOME/.rvm/usr</p><p>&#160;&#160;&#160;&#160;rails&#x30e6;&#x30fc;&#x30b6;&#x30fc;&#x304c;rvm&#x3092;&#x4f7f;&#x3063;&#x3066;&#x3044;&#x306a;&#x3044;&#x5834;&#x5408;&#x306f;<br />&#160;&#160;&#160;&#160;.bashrc<br />&#160;&#160;&#160;&#160;source &quot;$HOME/.rvm/scripts/rvm&quot;<br />&#160;&#160;&#160;&#160;&#x8ffd;&#x52a0;<br />&#160;&#160;&#160;<a href="http://d.hatena.ne.jp/zizgig/20120512/1336826698">&#x4eca;&#x66f4;&#x306a;&#x304c;&#x3089;ubuntu11.10&#x306b;rvm&#x3092;&#x5165;&#x308c;&#x305f;&#x306e;&#x3067;&#x5fd8;&#x308c;&#x306a;&#x3044;&#x3088;&#x3046;&#x306b;&#x30e1;&#x30e2;</a><br />- &#x5404;&#x7a2e;&#x30d1;&#x30c3;&#x30b1;&#x30fc;&#x30b8;&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;&#160;$ yum update<br />&#160;&#160;$ yum -y install gcc gcc-c++ autoconf git<br />&#160;&#160;$ yum -y install openssl-devel zlib-devel readline-devel curl-devel gettext-devel<br />&#160;&#160;$ yum -y install httpd-devel sqlite-devel<br />- libyaml&#x306e;&#x30a4;&#x30f3;&#x30b9;&#x30c8;&#x30fc;&#x30eb;<br />&#160;&#160;$ cd /usr/local/src<br />&#160;&#160;$ wget <a href="http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz">http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz</a><br />&#160;&#160;$ tar xzf yaml-0.1.4.tar.gz<br />&#160;&#160;$ cd yaml-0.1.4<br />&#160;&#160;$ ./configure<br />&#160;&#160;$ make &amp;&amp; make install<br />- SELinux&#x306e;&#x7121;&#x52b9;&#x5316;<br />&#160;&#160;aluminum&#x304c;&#x3084;&#x3063;&#x3066;&#x308b;<br />&#160;&#160;$ setenforce 0<br />&#160;&#160;&#x30a8;&#x30c7;&#x30a3;&#x30bf;&#x3067; /etc/sysconfig/selinux &#x3092;&#x958b;&#x304d;&#x3001;</p><p>&#160;&#160;SELINUX=enforcing<br />&#160;&#160;&#x3092;</p><p>&#160;&#160;SELINUX=disabled<br />&#160;&#160;&#x306b;&#x5909;&#x66f4;&#x3057;&#x3066;&#x304f;&#x3060;&#x3055;&#x3044;&#x3002;<br />- staging&#x74b0;&#x5883;&#x306e;&#x30c7;&#x30fc;&#x30bf;&#x30d9;&#x30fc;&#x30b9;&#x306e;&#x6e96;&#x5099;<br />&#160;&#160;&#160;mysql&gt; CREATE DATABASE hcoss_staging DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;<br />&#160;&#160;&#160;mysql&gt; GRANT ALL ON hcoss_staging.* TO 'hcoss'@'localhost';<br />&#160;&#160;&#160;mysql&gt; SET PASSWORD FOR 'hcoss'@'localhost' = PASSWORD('55Hmh0;ks');<br />&#160;&#160;&#160;mysql&gt; alter database hcoss_staging default character set utf8;<br />&#160;&#160;&#160;mysql&gt; show variables like '%character%';<br />&#160;&#160;&#160;exit<br />- Gemfile&#x306e;&#x8ffd;&#x52a0;<br />&#160;&#160;&#160;&#160;Gemfile&#x3092;&#x8ffd;&#x52a0;&#x3057;&#x3066;&#x3001;bundle install&#x3092;&#x5b9f;&#x884c;&#x3002;</p><p>&#160;&#160;&#160;&#160;group :deployment do<br />&#160;&#160;&#160;&#160;# Capistraono (Deploy&#x652f;&#x63f4;)<br />&#160;&#160;&#160;&#160;&#160;&#160;gem 'capistrano'<br />&#160;&#160;&#160;&#160;&#160;&#160;gem 'capistrano-ext'<br />&#160;&#160;&#160;&#160;&#160;&#160;gem 'capistrano_colors'<br />&#160;&#160;&#160;&#160;&#160;&#160;gem 'rvm-capistrano'<br />&#160;&#160;&#160;&#160;end</p><p>&#160;&#160;&#160;&#160;# &#x30e1;&#x30f3;&#x30c6;&#x30ca;&#x30f3;&#x30b9;&#x30e2;&#x30fc;&#x30c9;&#x753b;&#x9762;&#x306e;&#x8868;&#x793a;<br />&#160;&#160;&#160;&#160;gem 'turnout'<br />- Capistrano&#x306e;&#x8a2d;&#x5b9a;&#x30d5;&#x30a3;&#x30eb;&#x3092;&#x751f;&#x6210;<br />&#160;&#160;&#160;&#160;$ capify .<br />&#160;&#160;&#160;&#160;&#x7d9a;&#x3044;&#x3066;&#x3001;staging&#x74b0;&#x5883;/production&#x74b0;&#x5883;&#x5c02;&#x7528;&#x306e;Capistrano&#x8a2d;&#x5b9a;&#x30d5;&#x30a1;&#x30a4;&#x30eb;&#x3092;&#x4f5c;&#x6210;&#x3002;</p><p>&#160;&#160;&#160;&#160;mkdir config/deploy<br />&#160;&#160;&#160;&#160;touch config/deploy/staging.rb<br />&#160;&#160;&#160;&#160;touch config/deploy/production.rb<br />- Capistrano&#x5171;&#x901a;&#x306e;&#x30c7;&#x30d7;&#x30ed;&#x30a4;&#x8a2d;&#x5b9a;<br />&#160;&#160;&#160;&#160;config/deploy.rb<br />- Capistrano Staging&#x74b0;&#x5883;&#x306e;&#x30c7;&#x30d7;&#x30ed;&#x30a4;&#x8a2d;&#x5b9a;<br />&#160;&#160;&#160;&#160;config/deploy/staging.rb<br />- Capistrano Producion&#x74b0;&#x5883;&#x306e;&#x30c7;&#x30d7;&#x30ed;&#x30a4;&#x8a2d;&#x5b9a;<br />&#160;&#160;&#160;&#160;config/deploy/production.rb<br />- &#x30e1;&#x30f3;&#x30c6;&#x30ca;&#x30f3;&#x30b9;&#x753b;&#x9762;&#x306e;&#x8a2d;&#x5b9a;<br />&#160;&#160;&#160;&#160;config/maintenace.yml<br />- DB&#x8a2d;&#x5b9a;<br />&#160;&#160;&#160;&#160;database.yml<br />- &#x30c7;&#x30d7;&#x30ed;&#x30a4;&#x524d;&#x306e;&#x30c1;&#x30a7;&#x30c3;&#x30af;&#x30ea;&#x30b9;&#x30c8;<br />&#160;&#160;&#160;&#160;<b> deploy.rb, staging.rb, production.rb&#x306e;&#x30d1;&#x30e9;&#x30e1;&#x30fc;&#x30bf;&#x3092;&#x3059;&#x3079;&#x3066;&#x8a2d;&#x5b9a;&#x3057;&#x305f;&#x304b;&#x30c1;&#x30a7;&#x30c3;&#x30af;<br />&#160;&#160;&#160;&#160;</b> &#x30b9;&#x30c6;&#x30fc;&#x30b8;&#x30f3;&#x30b0;DB&#x3001;&#x672c;&#x756a;DB&#x306e;&#x8a2d;&#x5b9a;&#x3092;database.yml&#x306b;&#x8ffd;&#x52a0;&#x3057;&#x3066;&#x3044;&#x308b;&#x304b;&#xff1f;<br />&#160;&#160;&#160;&#160;* &#x30c7;&#x30d7;&#x30ed;&#x30a4;&#x7528;Git&#x30ea;&#x30dd;&#x30b8;&#x30c8;&#x30ea;&#x306e;&#x30d6;&#x30e9;&#x30f3;&#x30c1;&#x304c;&#x6700;&#x65b0;&#x306e;&#x72b6;&#x614b;&#x304b;&#xff1f;<br />- &#x30c7;&#x30d7;&#x30ed;&#x30a4;&#x624b;&#x9806;<br />&#160;&#160;&#160;&#160;cap staging deploy:setup<br />&#160;&#160;&#160;&#160;cap staging deploy</p><p>&#160;&#160;&#160;&#160;cap production deploy:setup<br />&#160;&#160;&#160;&#160;cap production deploy      </p><p>&#160;&#160;&#160;&#160;is not in the sudoers file&#x3068;&#x51fa;&#x305f;&#x3068;&#x304d;&#x306f;<br />&#160;&#160;&#160;&#160;visudo&#x3067;<br />&#160;&#160;&#160;&#160;rails   ALL=(ALL)    ALL&#x3092;&#x8ffd;&#x52a0;<br />- Apach&#x30d0;&#x30fc;&#x30c1;&#x30e3;&#x30eb;&#x30db;&#x30b9;&#x30c8;&#x3092;&#x8a2d;&#x5b9a;<br />&#160;&#160;&#160;&#160;&#x30b9;&#x30c6;&#x30fc;&#x30b8;&#x30f3;&#x30b0;&#x74b0;&#x5883;&#x3067;&#x306f;RailsEnv&#x306b;&#x6ce8;&#x610f;&#x3059;&#x308b;&#x3053;&#x3068;<br />&#160;&#160;&#160;&#160;sudo vi /etc/httpd/conf/httpd.conf<br />&#160;&#160;&#160;&#160;#ServerName centossrv.com:80&#x884c;&#x982d;&#x306b;#&#x3092;&#x8ffd;&#x52a0;&#x3057;&#x3066;&#x30b3;&#x30e1;&#x30f3;&#x30c8;&#x30a2;&#x30a6;&#x30c8;<br />&#160;&#160;&#160;&#160;NameVirtualHost *:80&#x30b3;&#x30e1;&#x30f3;&#x30c8;&#x89e3;&#x9664;(&#x30d0;&#x30fc;&#x30c1;&#x30e3;&#x30eb;&#x30db;&#x30b9;&#x30c8;&#x6709;&#x52b9;&#x5316;)</p><p>&#160;&#160;&#160;&#160;sudo vi /etc/httpd/conf.d/vhost.conf<br />&#160;&#160;&#160;&#160;&lt;VirtualHost *:80&gt;<br />&#160;&#160;&#160;&#160;&#160;&#160;&lt;Location /&gt;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&lt;IfModule mod_deflate.c&gt;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;SetOutputFilter DEFLATE</p><p>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;SetEnvIfNoCase Request_URI \<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;\.(?:gif|jpe?g|png)$ no-gzip dont-vary</p><p>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Header append Vary User-Agent env=!dont-vary<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&lt;/IfModule&gt;<br />&#160;&#160;&#160;&#160;&#160;&#160;&lt;/Location&gt;<br />&#160;&#160;&#160;&#160;&#160;&#160;ServerName hcoss.dev.k2-works.net<br />&#160;&#160;&#160;&#160;&#160;&#160;ServerAlias *.dev.k2-works.net<br />&#160;&#160;&#160;&#160;&#160;&#160;DocumentRoot /var/rails/hcoss/current/public/<br />&#160;&#160;&#160;&#160;&#160;&#160;RailsEnv staging<br />&#160;&#160;&#160;&#160;&#160;&#160;PassengerEnabled on<br />&#160;&#160;&#160;&#160;&#160;&#160;RemoveHandler .cgi .php<br />&#160;&#160;&#160;&#160;&lt;/VirtualHost&gt;</p><p>&#160;&#160;$ apachectl cofigtest<br />&#160;&#160;</p></body>
</html>
</richcontent>
</node>
</node>
<node text="&#x672c;&#x756a;&#x74b0;&#x5883;&#x306e;&#x69cb;&#x7bc9;">
<node style="bubble" background_color="#eeee00">
<richcontent TYPE="NODE"><html>
<head>
<style type="text/css">
<!--
p { margin-top: 3px; margin-bottom: 3px; }-->
</style>
</head>
<body>
<p></p><p><br /></p></body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
</node>
</map>
