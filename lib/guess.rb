require "guess/version"
require 'set'

module Guess
  class << self
    def gender(name)
      name = name.to_s.downcase
      index = name.index(",")
      first_name = index ? name[(index + 1)..-1] : name
      first_name = first_name.split.first

      if neutral_names.include?(first_name)
        return {:gender => "unknown", :confidence => nil}
      end

      freq_male = male_frequencies[first_name]
      freq_female = female_frequencies[first_name]
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
      File.open("#{file_path}/#{name}.txt", "r").each_line do |line|
        name, freq, _, _ = line.split
        dist[name.downcase] = freq.to_f
      end
      dist
    end

    def gem_root
      @gem_root ||= File.expand_path("../..", __FILE__)
    end

    def male_frequencies
      @male_frequencies ||= parse_file("male")
    end

    def female_frequencies
      @female_frequencies ||= parse_file("female")
    end

    def neutral_names
      @neutral_names ||= begin
        names = []
        File.open("#{file_path}/unknown.txt", "r").each_line {|line| names << line.split.first.downcase}
        Set.new(names)
      end
    end

    def file_path
      "#{gem_root}/lib/guess"
    end
  end
end
