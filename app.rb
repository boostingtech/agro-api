#microservice - boosting.tech

require 'sinatra'
require 'sinatra/namespace'
require 'mechanize'

    def get_arroba
        agent = Mechanize.new
        page = agent.get('https://cepea.esalq.usp.br/br/widgetproduto.js.php?id_indicador%5B%5D=2')
        page = page.search('.maior')
        return {page[0].text => page[1].text.to_f}
    end

    namespace '/api/v1' do
        before do
            content_type 'application/json'
        end
        get '/arroba' do
            get_arroba.to_json
        end
    end
