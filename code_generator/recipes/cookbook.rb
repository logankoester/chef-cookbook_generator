context = ChefDK::Generator.context
cookbook_dir = File.join(context.cookbook_root, context.cookbook_name)
attribute_context = context.cookbook_name.gsub(/-/, '_')

# Create cookbook directories
cookbook_directories = [
  'attributes',
  'recipes',
  'templates/default',
  'files/default',
  'spec/data_bags',
  'spec/fixtures',
  'test/integration/data_bags',
  'test/integration/default/serverspec/default'
]
cookbook_directories.each do |dir|
  directory File.join(cookbook_dir, dir) do
    recursive true
  end
end

# Create basic files
files_basic = [
  'chefignore',
  'Berksfile',
  'Gemfile',
  'LICENSE',
  'Rakefile',
  '.rspec',
  '.gitignore',
  'Guardfile',
  'spec/fixtures/arch.json',
  'spec/spec_helper.rb',
  'test/integration/default/serverspec/default/default_spec.rb'
]
files_basic.each do |file|
  cookbook_file File.join(cookbook_dir, file) do
    action :create_if_missing
  end
end

cookbook_file File.join(cookbook_dir, 'test/integration/default/serverspec/spec_helper.rb') do
  source 'default/test_spec_helper.rb'
  action :create_if_missing
end

# Create basic files from template
files_template = [
  'metadata.rb',
  'README.md',
  '.kitchen.yml',
  'default_spec.rb'
]
files_template.each do |file|
  template File.join(cookbook_dir, file) do
    helpers(ChefDK::Generator::TemplateHelper)
    action :create_if_missing
  end
end

# Create more complex files from templates
template "#{cookbook_dir}/attributes/default.rb" do
  source 'default_attributes.rb.erb'
  helpers(ChefDK::Generator::TemplateHelper)
  action :create_if_missing
  variables(
    attribute_context: attribute_context)
end
template "#{cookbook_dir}/recipes/default.rb" do
  source 'default_recipe.rb.erb'
  helpers(ChefDK::Generator::TemplateHelper)
  action :create_if_missing
end
