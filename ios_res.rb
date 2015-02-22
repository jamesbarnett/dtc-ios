#/usr/bin/env ruby -w

require 'dimensions'

devices = {
  iphone5: { res: [1136, 640], suffix: "-568h@2x" },
  iphone6: { res: [1334, 750] },
  iphone6plus: { res: [2208, 1242] },
  ipad: { res: [1024, 768], suffix: "~ipad" },
  ipad_retina: { res: [2048, 1536], suffix: "@2x~ipad"}
}

def aspect_ratio(size)
  [size.first / size.last.to_f, size.last / size.first.to_f]
end

def aspect_ratio_in_delta?(res, value, delta)
  ratio = aspect_ratio(res).first
  (value + delta >= ratio) && (value - delta <= ratio)
end

def report_image_info(file)
  dimensions = Dimensions.dimensions(file)
  ratios = aspect_ratio(dimensions)
  puts "#{file}: size: (#{dimensions.first}, #{dimensions.last}), ratios: #{ratios.first}, #{ratios.last}"
end

devices.each do |k, v|
  ratios = aspect_ratio(v[:res])
  puts "#{k}: size: (#{v[:res].first}, #{v[:res].last}), ratios: #{ratios.first}, #{ratios.last}"
end

puts "4mp+ ====="
Dir["#{ENV["HOME"]}/Downloads/*_4mp.jpg"].each do |file|
  report_image_info(file)
end

puts

puts "4:3 ====="
Dir["#{ENV["HOME"]}/Downloads/*4-3_full.jpg"].each do |file|
  report_image_info(file)
end

puts

puts "16:9 ====="
Dir["#{ENV["HOME"]}/Downloads/*16-9_full.jpg"].each do |file|
  report_image_info(file)
end

ar43 = devices.select {|device, info| aspect_ratio_in_delta?(info[:res], 1.33, 0.05) }
ar169 = devices.select {|device, info| aspect_ratio_in_delta?(info[:res], 1.77, 0.05) }

puts "4:3 - #{ar43}"
puts "16:9 - #{ar169}"

require 'mini_magick'

def out_filename(input, suffix)
  filename = input.dup
  filename.gsub! /_4-3_full\.jpg/, "#{suffix}.png"
  filename.gsub! /_16-9_full\.jpg/, "#{suffix}.png"
  filename
end

def resize_image(input, out, device)
  image = MiniMagick::Image.open input
  image.resize "#{device[:res].last}x#{device[:res].first}"
  image.format "png"
  image.write out_filename(input, device[:suffix])
end

Dir["#{ENV["HOME"]}/Downloads/*4-3_full.jpg"].each do |file|
  ar43.each do |device, info|
    puts "4:3 device: #{device}"
    puts "input file: #{file}, output file: #{file.gsub("_4-3_full", info[:suffix])}" if info[:suffix]
    resize_image(file, out_filename(file, info[:suffix]), info) if info[:suffix]
  end
end

Dir["#{ENV["HOME"]}/Downloads/*16-9_full.jpg"].each do |file|
  ar169.each do |device, info|
    puts "16:9 device: #{device}"
    puts "input file: #{file}, output file: #{file.gsub("_16-9_full", info[:suffix])}" if info[:suffix]
    resize_image(file, out_filename(file, info[:suffix]), info) if info[:suffix]
  end
end

