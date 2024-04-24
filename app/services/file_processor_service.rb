# This service controls if the extension of a file path is .csv.
class FileProcessorService
    
    def process_csv_file(file_path)
      if is_csv_file?(file_path)
        return true
      else
        return false
      end
    end
  
    private
  
    def is_csv_file?(file_path)
        if File.extname(file_path).casecmp('.csv').zero?
            true
        else
            false
        end
    end
end