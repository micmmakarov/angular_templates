require 'pry'

def partial(name, args = {}, dir = 'app/assets/templates/')
  require 'ostruct'
  namespace = OpenStruct.new(args)
  name += '.html'
  [name + '.haml', name + '.erb', name].each do |n|
    n = File.join(dir, n)
    next unless File.exist?(n) 
    return render_template(n)
  end
end

def load_templates(object, dir = 'app/assets/templates/')
  templates = Dir.glob("#{dir}**/*")
  result = ""
  templates.each do |template|
    key = template.split(dir).last.split(".").first
    line = "#{object}['#{key}'] = \"#{ApplicationController.helpers.escape_javascript(render_template(template))}\"\n"
    puts line
    result += line
  end
  result  
end

private

def render_template(file_name)
  extention = file_name.split(".").last
  if extention == "haml"
    tpl = Haml::Engine.new(File.new(file_name).read)
    compiled = tpl.render
    return compiled
  elsif extention == "erb"
    tpl = ERB.new(File.new(file_name).read)
    compiled = tpl.result(namespace.instance_eval { binding })
    return compiled
  end  
end
