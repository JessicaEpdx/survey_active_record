require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/survey')
require('./lib/question')
also_reload('lib/**/*.rb')
require('pg')

get('/') do
  @all_surveys = Survey.all()
  erb(:index)
end

post('/survey') do
  @all_surveys = Survey.all()
  @survey = Survey.new({:title => params.fetch("name")})
  if @survey.save()
    erb(:index)
  else
    erb(:errors)
  end
end

get('/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:survey)
end

post('/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  @survey.questions.new({:name => params.fetch("description")})
  if @survey.save()
    erb(:survey)
  else
    erb(:errors)
  end
end

get('/question/:id') do
  @question = Question.find(params.fetch("id").to_i)
  erb(:question)
end

post('/question/:id') do
  @question = Question.find(params.fetch("id").to_i)
  @question.responses.new({:input => params.fetch("input")})
  if @question.save
    erb(:question)
  else
    erb(:errors)
  end
end
