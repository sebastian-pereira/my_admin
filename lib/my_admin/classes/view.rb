module MyAdmin
  class View

    def self.factory(file_path, data = {})
      erb = ERB.new(File.read(MyAdmin.lib_root_path + "/views/#{file_path}.html.erb"))
      erb.result(binding).html_safe
    end
  end
end