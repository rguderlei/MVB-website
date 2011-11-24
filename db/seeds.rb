# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

pages = Page.create([
{:name=>"Impressum", :permalink=>"impressum", :main_content=>"TBD"},
{:name=>"&Uuml;ber uns", :permalink=>"about", :main_content=>"TBD"},
{:name=>"Vorstand", :permalink=>"vorstand", :main_content=>"TBD"},
{:name=>"Geschichte", :permalink=>"geschichte", :main_content=>"TBD"},
{:name=>"Satzung", :permalink=>"satzung", :main_content=>"TBD"},
{:name=>"JOI", :permalink=>"joi", :main_content=>"TBD"},
{:name=>"Stadtkapelle", :permalink=>"stadtkapelle", :main_content=>"TBD"},
{:name=>"Vorstand", :permalink=>"vorstand_stadtkapelle", :main_content=>"TBD"},
{:name=>"Sinfonieorchester", :permalink=>"sinfonieorchester", :main_content=>"TBD"},
{:name=>"Vorstand", :permalink=>"vorstand_sinfonieorchester", :main_content=>"TBD"},
                    ])
