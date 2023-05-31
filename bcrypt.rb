require 'bcrypt'

def encryptFile(filePath)

    text = File.read(filePath)
    salt = BCrypt::Engine.generate_salt
    encrypted = BCrypt::Engine.hash_secret(text, salt)
    encryptedPath = "#{filePath}.encrypted"
    File.write(encryptedPath, encrypted)

    puts "Encrypted file: #{encryptedPath}"

rescue Errno::ENOENT

    puts "File not found: #{filePath}"

end

file_path = 'my_file.txt'
encrypt_file(file_path)