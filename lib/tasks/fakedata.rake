require 'open-uri'
namespace :fakedata do

  task :generate => :environment do
    company_name = ENV['company']
    people_count = (ENV['people'] || 70).to_i

    raise "Company name not provided, set ENV var 'company'" unless company_name

    raise "Company name taken" if Company.where(name: company_name).exists?

    company = Company.create(name: company_name,
                             registration_code: "test-#{company_name.parameterize}")

    attr_types = {
      phone: AttributeType.create(company: company,
                                  icon: 'phone',
                                  attribute_name: 'Phone',
                                  attribute_type: 'Phone',
                                  description: 'Work phone',
                                  required: true),
      cell:  AttributeType.create(company: company,
                                  icon: 'phone',
                                  attribute_name: 'Cell',
                                  attribute_type: 'Phone',
                                  description: 'Mobile phone',
                                  required: true),
      addr:  AttributeType.create(company: company,
                                  icon: 'home',
                                  attribute_name: 'Location',
                                  attribute_type: 'Text',
                                  description: 'Home address',
                                  required: false),
      ssn:   AttributeType.create(company: company,
                                  icon: 'star',
                                  attribute_name: 'SSN',
                                  attribute_type: 'Text',
                                  description: 'Social Security #',
                                  required: false),
    }

    possible_tags = [
      'Soccer Mom',
      'Guru',
      'Newbie',
      'C-Level',
      'Team Lead',
      'Remote',
      'Admin',
      'DevOps',
      'Renegade',
      'Cool person'
    ]

    admin_created = false

    people_count.times do
      people_json = JSON.parse(open("http://api.randomuser.me/0.2/").read)
      u = people_json["results"].first["user"]

      admin = [*0..99].sample > 90
      person = Person.new(company: company,
                          name: "#{u['name']['first']} #{u['name']['last']}".titleize,
                          email: u['email'],
                          photo: u['picture'],
                          admin: admin,
                          password: 'testtest')

      unless admin_created
        person.email = "admin@#{company.name.parameterize}.com"
        person.admin = true
        admin_created = true
      end

      tag_count = [0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4].sample

      tags = []
      tag_count.times { tags << possible_tags.sample }
      person.tag_list = tags.uniq!

      PersonAttribute.update(person, attr_types[:phone].id, u['phone'])
      PersonAttribute.update(person, attr_types[:cell].id,  u['cell'])
      PersonAttribute.update(person, attr_types[:ssn].id,   u['SSN'])
      PersonAttribute.update(person, attr_types[:addr].id,
                                     u['location'].values.join(', ').titleize)
      person.save!
      puts "Created: #{person.email}"
    end
  end
end
