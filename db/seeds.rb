# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

List.create([{ name: '黑名单' }, { name: '白名单'}])

whitelist = List.find_by_name('白名单')
Qq.create({ number: '2355382359', list: whitelist, status: '正常' })

qq = Qq.find_by_number('2355382359')
Note.create({ qq: qq, content: '公职子集团，网站产品经理', creator: 'chinakr' })
