require 'spec_helper'
require 'generator_spec/test_case'
require 'generators/mero_cms/mero_cms_generator'

describe MeroCmsGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../tmp", __FILE__)
  tests MeroCmsGenerator

  before do
    prepare_destination
    copy_routes
  end

  it "creates a mero_cms mounted route" do
    run_generator
    assert_file "config/routes.rb", /mount MeroCms::Engine => '\/mero_cms\'/
  end

  specify do
    run_generator
    destination_root.should have_structure {
      directory "config" do
        directory "initializers" do
          file "mero_cms.rb" do
            contains "# Mero Cms Initializer"
            contains "MeroCms::Engine.login_url = :login_url"
            contains "MeroCms::Engine.logout_url = :logout_url"
            contains "MeroCms::Engine.unauthorized_url = :unauthorized_url"
            contains "MeroCms::Engine.current_user = :current_user"
            contains "MeroCms::Engine.can_manage_mero_cms = :can_manage_mero_cms"
          end
        end
      end
    }
  end

  def copy_routes
    routes = ::File.expand_path("../../dummy/config/routes.rb", __FILE__)
    destination = ::File.join(destination_root, "config")

    ::FileUtils.mkdir_p(destination)
    ::FileUtils.cp routes, destination
  end
end