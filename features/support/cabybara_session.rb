module Capybara
  class Session

    def back
      execute_script('window.history.back();')
    end

  end
end
