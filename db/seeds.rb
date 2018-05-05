# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



users = [
{email: 'a@a.com', name: 'a', bio: 'a', password:'blahblah'},
{email: 'b@a.com', name: 'b', bio: 'b', password:'blahblah'},
{email: 'c@a.com', name: 'c', bio: 'c', password:'blahblah'},
{email: 'd@a.com', name: 'd', bio: 'd', password:'blahblah'}
]

us = users.map do |user|
    User.create!(user)
end



rooms = [
    {name:'The Board', is_private: false},
    {name:'The Grid', is_private: false},
    {name:'Producer Zone', is_private: false},
    {name:'Lyricists', is_private: false},
    {name:'Events', is_private: true}
]


rs = rooms.map do |room|
    Room.create!(room)
end

messages = [
    {room: rs[0], user: us[0], content: 'I dunno what Speed Garage is,but a quick trip to youpube seems to show that it aint much different to 4x4 or 2step garage to be honest. other than sounding more grimey/lofi in terms of the production (Garage usually sounds a bit "slick"to me) maybe and being a lot more minimal.i know this stuff as "Bassline house"but it has more of a 90ies rave influence in these examples i went through (about 10 tracks)
        Short enveloped kicks and percussion(sounds like 909 mostly)with hardly any bottom end,cheesy swing,syncopation and subby square basses through an LP,forego the lounge and RnB flavas and sprinkle in some Hardcore Breakbeat and rave influences (stabs,one note minor chords,lotta sampling,M1 piano,"avin it laaahhhge m8") instead 
        Most of the stuff i flicked through sounded like it was done with samplers as well.possibly later AKAI\'s s3200,couple of E-Mu romplers maybe
        Some of it was also downright tasteless though,so perhaps provide some examples :D'},
    {room: rs[0], user: us[1], content: 'that does sound like a fairly good evaluation of it, though i love it. think it might be possible to overdo the swing though. i thought speed garage as a term was universal, though its mainly just called bassline round wherre i live these days'},
    {room: rs[0], user: us[2], content: 'Yeah i know it as Bassline as well from around Yorkshire and The
        Midlands especially (weirdly they still have a massive Bassline scene in Wolverhampton for example)just found it odd when i was there, cause it\'s sort of a fringe genre lol'},
    {room: rs[1], user: us[0], content: 'i always think as bassline as being speed garage being reinvented for the millanials. as such i call what i like speed garage. maybe i shoiuld get witht he times a bit more. its sort of fringe, but northerners like myself love it. Of the \'Bassline\' ive heard though none matches 90s speed garage for vibes, though the production quality has certainly moved on'},
    {room: rs[1], user: us[1], content: 'You are probably right.i only became aware of it in the early noughties from working around the country.happened to spend a lot of time in Huddersfield where it was all "poppin off"for that kinda 4x4 Garage revival stuff.colloquially for me its all Bassline, though some of the older Speed Garage stuff i was browsing through then (guessing or assuming from the 90ies)sounds very ravey though.like they just took an Altern-8 track or The Ratpack and removed the breaks and dropped the tempo by 20bpm'},
    {room: rs[1], user: us[2], content: 'yeah i giess theres some rave element. i normally think of it more as American garage but with heavier basslines though, personally. it often has \'diva\' ish vocals. or sometimes ragga influenced stuff thrown in. its deceptively hard to make though. the basslines sound easy but coming up with a good one isnt'}
]

messages.each do |m|
    Message.create!(m)
end

