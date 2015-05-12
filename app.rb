require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/survey')
require('./lib/question')
require('./lib/response')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

get('/') do
  erb(:index)
end

get('/surveys') do
  @all_surveys = Survey.all()
  erb(:surveys)
end

post('/survey') do
  @all_surveys = Survey.all()
  @survey = Survey.new({:title => params.fetch("name")})
  if @survey.save()
    erb(:surveys)
  else
    erb(:errors)
  end
end

get('/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:survey)
end

post('/survey/:id') do
  @all_surveys = Survey.all()
  @survey = Survey.find(params.fetch("id").to_i)
  @survey.questions.new({:name => params.fetch("description")})
  if @survey.save()
    erb(:survey)
  else
    erb(:errors)
  end
end

patch('/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  @survey.update({:title => params.fetch("title")})
  @all_surveys = Survey.all()
  erb(:survey)
end

delete('/survey/:id') do
  survey = Survey.find(params.fetch("id").to_i)
  survey.delete()
  @all_surveys = Survey.all()
  erb(:surveys)
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

patch('/question/:id') do
  @question = Question.find(params.fetch("id").to_i)
  @question.update({:name => params.fetch("name")})

  erb(:question)
end

delete('/survey/question/:id') do
  question = Question.find(params.fetch("id").to_i)
  question.delete()
  @all_surveys = Survey.all()
  erb(:survey)
end

get('/takers') do
  @all_surveys = Survey.all()
  erb(:takers)
end

get('/takers/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:takers_survey)
end

get('/takers/question/:id') do
  erb(:takers_question)
end
