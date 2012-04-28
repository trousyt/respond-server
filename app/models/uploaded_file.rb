require 'ftools'

class UploadedFile 
  
  STORAGE_DIR = "public/images/"
  
  def inputfile=(input)    
    
    # Gen a guid to use in the path
    @@guid = rand(36**8).to_s(36)
    
    @@file_name = sanitize_filename(
      "#{@guid}.jpg")
      
    @@file_type = 'image/jpeg' #input.content_type
  end
  
  def inputfile
    @@file_name
  end
  
  def file_path
    t = Time.parse(@@guid)
    File.join(UploadedFile::STORAGE_DIR, "#{t.year}/#{t.month}/#{t.day}/")
  end
  
  def contents
    File.open(File.join(self.file_path, self.file_name)).read.to_s
  end
  
  # before_destroy
  def prepare_file_for_delete
    @filename = File.join(self.file_path, self.file_name)
  end
  
  # after_create
  def write_file(data = nil)
    # allow user to provide data
    contents = data || @file_contents.read
    
    # make sure that there is data to write
    if contents
      # filename to use
      filename = @@file_name
    
      # directory to store it in
      dir = @@file_path
    
      # create the nested directory to store the file
      File.makedirs dir.to_s unless File.directory?(dir)
    
      # write the file
      File.open( File.join(dir, filename), "wb") { |f| f.write(contents) }
    end
  end
  
  # after_destroy
  def delete_file
    if @filename.nil? || @filename.empty?
      return
    end
    
    file_exists = File.exists?(@filename)
          
    if file_exists
      File.delete(@filename)
    end
  end
  
  private
  
    # santize filenames removing non-alphanumeric 
    def sanitize_filename(filename)
      # IE likes to include the entire path, rather than just the filenam
      just_filename = File.basename(filename) 
    
      # replace all none alphanumeric, underscore or perioids with underscore
      just_filename.sub(/[^\w\.\-]/,'-').downcase
    end
end