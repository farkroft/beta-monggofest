# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#require 'csv'
@prov = Province.all
@reg = Regional.all
@kec = Kecamatan.all
if @kec.present?
puts "Error, you must to destroy your data on the table and please reset your id. \n ALTER SEQUENCE kecamatans_id_seq RESTART WITH 1 \n please put that on the psql interface for reset kecamatan id "
else
csv_text = File.read(Rails.root.join('lib', 'seeds' , 'kecamatan.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    r = Kecamatan.new
    r.regional_id = row['regional_id']
    r.name = row['name']
    r.save
    puts row.to_hash
end
end
if @reg.present?
puts "Error, you must to destroy your data on the table and please reset your id. \n ALTER SEQUENCE reionals_id_seq RESTART WITH 1.\n Pleace put that to reset regional"
else
csv_text = File.read(Rails.root.join('lib', 'seeds' , 'regional.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    r = Regional.new
    r.province_id = row['province_id']
    r.name = row['name']
    r.save
    puts row.to_hash
end
end
if @prov.present?
puts "Error, you must to destroy your data on the table and please reset your id with this comment to your database engine.\nALTER SEQUENCE reionals_id_seq RESTART WITH 1 "
else
csv_text = File.read(Rails.root.join('lib', 'seeds' , 'province.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    r = Province.new
    r.name = row['name']
    r.save
    puts row.to_hash
end
end

/data = [
    { :province_name => "Sumatra Utara", :regional_name => "batam"},
    { :province_name => "Sumatrhj", :regional_name => "batam"}
]
data.map do |k,v|
  province = Province.where("name ilike ?", "%{k[:province_name]}%").last
  if province.present?
    Regional.create(province_id: province.id, name: k[:regional_name] )
  end*/
