module SolicitationsHelper
  def map_status solicitation
    case solicitation.status
    when 'analise'
      "Em Análise"
    when 'reprovado'
      "Reprovado"
    when 'aprovado'
      "Aprovado"
    else
      "Análise"
    end
  end

  def map_kind solicitation
    case solicitation.kind
    when 'passagem'
      "Passagem"
    when 'diaria'
      "Diária"
    else
      "Error"
    end
  end


end
