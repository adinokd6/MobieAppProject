# config/initializers/swagger-docs.rb
Swagger::Docs::Config.register_apis({
  "1.0" => {
    :api_file_path => "public/",
    :base_path => "http://localhost:3000",
    :clean_directory => true,
    :parent_controller => ActionController::Base,
    :attributes => {
      :info => {
        "title" => "Student forum",
        "description" => "Example rails app"
      }
    }
  }
})
