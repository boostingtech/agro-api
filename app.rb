#microservice - boosting.tech

require 'sinatra'
require 'sinatra/namespace'
require 'mechanize'

    def get_arroba
        arr = []
        agent = Mechanize.new
        page = agent.get('https://cepea.esalq.usp.br/br/widgetproduto.js.php?id_indicador%5B%5D=2')
        page.search('.maior').each do |p|
            arr <<  p.text
        end
        return arr
    end

    namespace '/api/v1' do
        before do
            content_type 'application/json'
        end
        get '/arroba' do
            get_arroba.to_json
        end
    end
