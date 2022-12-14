require "securerandom"
require 'fileutils'

NUMBER_OF_STUDENTS = 24;
NUMBER_OF_GRADING = 3;
DESTINATION_PATH = "../School-Assigment-Results"

a = [];
b = [];

NUMBER_OF_STUDENTS.times { |i| b << i+1}
NUMBER_OF_GRADING.times { a += b }


Dir.glob("./*.sql").sort.each do |entry|
  number_in_class = entry.split("_").first.gsub("./", "").to_i
  new_numbers = []
  new_name = SecureRandom.hex(5)
  NUMBER_OF_GRADING.times do
    "Picking student for #{number_in_class} \n"
    random_index = Random.rand(a.length)
    print("random_index = #{random_index}\n")
    randomly_selected_student = a[random_index]

    while number_in_class == randomly_selected_student || new_numbers.include?(randomly_selected_student)
      random_index = Random.rand(a.length)
      randomly_selected_student = a[random_index]
    end
    a.delete_at(random_index)

    new_numbers << randomly_selected_student
  end
  new_entry = "#{DESTINATION_PATH}/#{new_name}_#{new_numbers.join("_")}.sql"
  print("Rename #{entry} to #{new_entry}\n")
  FileUtils.cp(entry, new_entry)
end

print("Left over Students: #{a}\n")
print("Number of left over Students: #{a.uniq.count}")