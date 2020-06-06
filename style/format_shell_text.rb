# frozen_string_literal: true

module Style
  ##
  # ColorizeShell
  class FormatShellText
    def initialize(*args)
      puts args.length
      raise 'Args error' if args.length != 2

      @username = args[0]
      @path = args[1]
      format_path_string
    end

    def format_path_string
      @path["/home/#{@username}"] = '~'
    end

    def format_string
      "#{green(@username.capitalize)}: #{blue(@path)} $"
    end

    def green(string)
      "\e[32m#{string}\e[0m"
    end

    def blue(string)
      "\e[34m#{string}\e[0m"
    end

    def red(string)
      "\e[31m#{string}\e[0m"
    end
  end
end
