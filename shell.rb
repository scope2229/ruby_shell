#!/usr/bin/env ruby
# frozen_string_literal: true

require 'readline'
require_relative 'shell_parser'
require_relative 'transform'
require_relative 'auto_complete'
require_relative 'style/format_shell_text'
require_relative 'commands/history'

##
# Entry point for out shell application
# Handles exiting the app along with displaying Readline::History
# If app is not exited or hist requested then the commands are processed 
def main
  loop do
    # current path used for readline
    cmdline = Readline.readline("#{shell_format} ", true)
    break if %w[exit quit q].include?(cmdline)

    Readline::HISTORY.pop if %w[hist ""].include?(cmdline) # == '' || cmdline == 'hist'
    # next if cmdline.include?('hist')
    check_type_of_command(cmdline)
    # shell_command(cmdline)

  end
end

def shell_format
  # We want the user logged in the the system with uppercase first letter
  # followed by the current working directory.
  # Username should be green with the directory blue and the $ sign white
  # Example text format:
  #         MrSmith:~/Documents $
  system_username = ENV['USER'] || ENV['USERNAME']
  current_working_dir = Dir.pwd
  string_format = Style::FormatShellText.new(system_username, current_working_dir)
  string_format.format_string
end

def check_type_of_command(cmdline)
  case cmdline
  when 'hist'
    puts create_history.hist
  when 'clear_hist'
    create_history.clear_history
  when 'help'
    puts 'you asked for help'
  when "\n"
    puts ''
  else
    shell_command(cmdline)
  end
end

def shell_command(cmdline)
  tree = parse_cmdline(cmdline)
  # here we need to check custom commands
  pids = tree.execute($stdin.fileno, $stdout.fileno)
  pids.each do |pid|
    Process.wait(pid)
  end
  # rescue from empty user inputs
rescue Parslet::ParseFailed
  ''
rescue Errno::ENOENT
  puts 'commands does not exist'
end

def parse_cmdline(cmdline)
  raw_tree = ShellParser.new.parse(cmdline)
  Transform.new.apply(raw_tree)
end

def create_history
  Commands::History.new
end

main
