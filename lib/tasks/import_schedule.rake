# encoding: utf-8
namespace :import do
  desc 'download and import'
  task from_web: :environment do
    response = HTTParty.get('https://www.thatconference.com/Schedule/ExcelSchedule?year=2018')
    CSV.parse(response.body, headers: true, encoding: "UTF-32BE:UTF-8" ) do |row|
      name = row["Name"].encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
      first_name = name.split(" ")[0]
      last_name = name.split(" ")[-1]

      session = Session.find_or_create_by(title: row["Title"].encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: ''))
      session.room_id = Room.find_or_create_by(name: row["Room"]).id
      session.primary_category_id = Category.find_or_create_by(name: row["PrimaryCategory"]).id
      session.secondary_category_id = Category.find_or_create_by(name: row["SecondaryCategory"]).id
      session.level_id = Level.find_or_create_by(name: row["Level"]).id
      session.description = row['Description'].encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
      session.speaker_id = Speaker.find_or_create_by(first_name: first_name, last_name: last_name).id

    session.day = row['Day']
    session.time = row["Scheduled"]
      session.save!
    end
  end
end
