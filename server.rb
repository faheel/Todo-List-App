require 'sinatra'

task_list = []

get '/' do
	erb :todo, :locals => {:tasks => task_list}
end

post '/add_task' do
	task = params[:task]
	unless task == ''
		task_list << {:name => task, :is_completed => false}
	end
	return redirect '/'
end

post '/toggle_completed' do
	task_name = params[:task_name]
	task_list.each do |task|
		if task_name == task[:name]
			task[:is_completed] ^= true		# toggle using bitwise XOR
		end
	end
	return redirect '/'
end