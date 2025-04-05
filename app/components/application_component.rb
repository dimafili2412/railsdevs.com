class ApplicationComponent < ViewComponent::Base
  include Classy::Yaml::ComponentHelpers
  include UrlHelpersWithDefaultUrlOptions
  include Turbo::StreamsHelper
end
