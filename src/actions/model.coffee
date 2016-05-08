Client = require("../../helpers/api-client")

exports.actions = {
	SAVE_EDIT: "edit/SAVE_MODEL"
}

saveEdit = (action, {getState, dispatch})->
	client = new Client()
	action.model = getState().edit	
	client.post(action)
	.then(
		(val)->
			console.log val:val, "returned"
		(err)->
			console.error err:err, "error returning"
		)


exports.operations = {
	saveEdit
}