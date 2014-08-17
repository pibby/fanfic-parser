# Fanfiction.net Parser/Compiler
## Install and Usage
1. Clone this repo with `git clone https://github.com/pibby/fanfic-parser.git`
2. Install the nokogiri gem with `gem install nokogiri`
3. Run parse.rb in a terminal with `ruby parse.rb` and enter the story's ID when prompted. (The story ID is the set of numbers that appears in the URL immediately after /s/, example: https://www.fanfiction.net/s/9342824/1/Goodbye-to-Yesterday, the story ID is *9342824*
4. The program will download each chapter and append it to one file. When the program indicates that it is complete, open the .html file to read the story

## Changing the Appearance
I've styled this in a way that I find easily readable, but if you don't care for my styles, you can edit them in the `template_begin` variable between the `<style>` tags.
