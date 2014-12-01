pm-cucumber-tests
=====================
Behavior Driver Developement tests with #Cucumber based on Ruby.

In order to execute cucumber test you need setup your environment follow the next steps:

1. Dowload ruby 1.9.3 from http://rubyinstaller.org/downloads/   and install checked all in all steps  (Use mozilla or chrome). 
2. Dowload devkit   from http://rubyinstaller.org/downloads/ (Use mozilla or chrome).

3. Install devkit

 - Left double-click the self-extracting executable (SFX) downloaded from Step 2 and create a directory named 'Devkit' to install the DevKit artifacts into from command line:
 -
    $ cd <DEVKIT_INSTALL_DIR> from command prompt.

    $ Inside the command line execute "ruby dk.rb init".
    
    $ Inside the command line execute "ruby dk.rb install".
 
 
4. After, install the next gems from command line:

    $ gem install capybara
    
    $ gem install cucumber
    
    $ gem install selenium-webdriver
    $gem install site_prism  (SitePrism gives you a simple, clean and semantic DSL for describing your site using the Page Object Model pattern, for use with Capybara)
    $ gem install rspec

5. Then, when you have your features ready to test execute the next command from commad line:
    project/path/before/features/folder$ cucumber

NOTE: Please don't forget to have installed ProcessMaker v2.8 or later.
