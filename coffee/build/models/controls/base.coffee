
# Base Control
# ============


define [

	'jquery'
	'underscore'
	'backbone'

], ($, _, Backbone) ->


	
	BaseControl = Backbone.Model.extend

		# events: 
		# 	'change:name':'updateName'

		updateThings: ->
			@on 'change:name-display',@updateName

		updateName: ->
			@set 'name',@urlSafe(@get('name-display'))

		urlSafe: (string) ->
			string = string.toLowerCase()
			string = string.replace(new RegExp(' ', 'g'), '-')

		randomName: (prefix) ->
			prefix = prefix.charAt(0).toUpperCase() + prefix.slice(1);
			rando = Math.floor Math.random()*@words.length
			name = prefix + ' ' + @words[rando] 
			(name.split(' ').map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '
			return prefix+' '+Math.floor Math.random()*2000

		randomDescription: () ->
			phrase = ''
			for idx in [0...3]
				rando = Math.floor Math.random()*@words.length
				phrase += @words[rando] + ' '
			phrase = phrase.charAt(0).toUpperCase() + phrase.slice(1)
			phrase = phrase.replace /^\s+|\s+$/g, ""
			phrase += '.'
			return phrase


		words: ["ethical","reprehenderit","delectus","non","latte","fixie","mollit","authentic","1982","moon","helvetica","dreamcatcher","esse","vinyl","nulla","Carles","bushwick","bronson","clothesline","fin","frado","jug","kale","organic","local","fresh","tassel","liberal","art","the","of","bennie","chowder","daisy","gluten","hog","capitalism","is","vegan","ut","farmtotable","etsy","incididunt","sunt","twee","yr","before","gentrify","whatever","wes","Anderson","chillwave","dubstep","sriracha","voluptate","pourover","esse","trustfund","DSLR","vintage","dumpster","totally","selvage","glutenfree","brooklyn","placeat","delectus","sint","magna","brony","pony","party","beer","shot","narwhal","letterpress","art","party","streetart","seitan","anime","wayfarers","nonethical","viral","iphone","anim","polaroid","gastropub","city","classy","original","brew"]

	return BaseControl