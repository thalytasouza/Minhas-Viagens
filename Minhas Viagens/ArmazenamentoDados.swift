import UIKit

class ArmazenamentoDados {
    
    let chaveArmazenamento = "locaisViagem"
    var viagens = [Dictionary<String, String>]()
    
    func getDefauts() -> UserDefaults {
        return UserDefaults.standard

    }
    
    func salvarViagem(viagem: Dictionary<String,String>) {
        
        viagens = listarViagens()
        
        viagens.append(viagem)
        getDefauts().set(viagens, forKey: chaveArmazenamento)
        getDefauts().synchronize()
    }
    
    func listarViagens() -> [ Dictionary<String, String>] {
        let dados = getDefauts().object(forKey: chaveArmazenamento)
        if dados != nil {
            return dados as! [Dictionary<String, String>]
        }else{
            return []
        }
    }
    
    func removerViagem(indice: Int) {
        
        viagens = listarViagens()
        viagens.remove(at: indice)
        
        getDefauts().set(viagens, forKey: chaveArmazenamento)
        getDefauts().synchronize()
        
    }
}
