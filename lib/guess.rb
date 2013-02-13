require "guess/version"

module Guess
  class << self

    def gendered_form_of(form, name)
      g = gender(name)[:gender].to_sym
      case form
      when :theirs # "the gem is his/hers/theirs"
        case g
        when :male then "his"
        when :female then "hers"
        when :unknown then "theirs"
        end
      when :their # "it's his/her/their gem"
        case g
        when :male then "his"
        when :female then "her"
        when :unknown then "their"
        end
      when :they # "he/she/they are writing this gem"
        case g
        when :male then "he"
        when :female then "she"
        when :unknown then "they"
        end
      else
        form.to_s # return the given word if it doesn't match any of the available forms
      end
    end

    def gender(name)
      name = name.to_s.downcase
      index = name.index(",")
      first_name = index ? name[(index+1)..-1] : name
      first_name = first_name.split.first

      freq_male = FREQ_MALE[first_name]
      freq_female = FREQ_FEMALE[first_name]
      p_male = freq_male / (freq_male + freq_female)
      gender, confidence =
      if freq_male > freq_female
        ["male", p_male]
      elsif freq_female > freq_male
        ["female", 1 - p_male]
      else
        ["unknown", nil]
      end
      {:gender => gender, :confidence => confidence}
    end

    def parse_file(name)
      dist = Hash.new(0.0005)
      File.open("#{gem_root}/lib/guess/#{name}.txt", "r").each_line do |line|
        name, freq, cum_freq, rank = line.split
        dist[name.downcase] = freq.to_f
      end
      dist
    end

    def gem_root
      @gem_root ||= File.expand_path("../..", __FILE__)
    end

  end

  FREQ_MALE = parse_file("male")
  FREQ_FEMALE = parse_file("female")

end
