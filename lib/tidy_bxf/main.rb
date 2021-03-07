# frozen_string_literal: true

require 'pathname'

class TidyBxf
  def initialize(filepath)
    @src = filepath
    @base_path = Pathname.new("#{__dir__}/../../bin/tidy").cleanpath
    @binary_path = TidyBxf.configuration.binary_path
  end

  private

  def run(args)
    output = if @binary_path.nil? || @binary_path&.empty?
               `LD_LIBRARY_PATH=#{@base_path} #{@base_path}/tidy #{args}`
             else
               `#{@binary_path} #{args}`
             end

    { ok: $?.success?, out: output }
  end
end

