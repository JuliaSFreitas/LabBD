package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Motorista;
import model.Onibus;
import model.Viagem;

public class ViagemDao implements IViagemDao {

private GenericDao gDao;
	
	public ViagemDao (GenericDao gDao) {
		this.gDao = gDao;
	}
	
	@Override
	public String insereViagem(Viagem v) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "INSERT INTO viagem VALUES(?,?,?,?,?,?,?)";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1,v.getCodigoviagem());
		ps.setInt(2,v.getHora_saida());
		ps.setInt(3,v.getHora_chegada());
		ps.setString(4,v.getPartida());
		ps.setString(5,v.getDestino());
		ps.setInt(6,v.getMotorista().getCodigo());
		ps.setString(7,v.getOnibus().getPlaca());
		ps.execute();
		ps.close();
		c.close();
		
		return "Viagem inserido com sucesso";
	}

	@Override
	public String atualizaViagem(Viagem v) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		StringBuffer sql =  new StringBuffer();
		sql.append("UPDATE viagem SET codigo = ?, onibus = ?, motorista = ?, ");
		sql.append("hora_saida = ?, hora_chegada = ?, partida = ?, chegada = ? ");
		sql.append("WHERE codigo = ? ");
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ps.setInt(1,v.getCodigoviagem());
		ps.setInt(2,v.getMotorista().getCodigo());
		ps.setString(3,v.getOnibus().getPlaca());
		ps.setInt(4,v.getHora_saida());
		ps.setInt(5,v.getHora_chegada());
		ps.setString(6,v.getPartida());
		ps.setString(7,v.getDestino());
		ps.execute();
		ps.close();
		c.close();
		
		return "Viagem atualizada com sucesso";
	}

	@Override
	public String excluiViagem(Viagem v) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "DELETE viagem WHERE codigo = ? ";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1,v.getCodigoviagem());
		ps.execute();
		ps.close();
		c.close();
		
		return "Viagem excluido com sucesso";
	}

	@Override
	public Viagem consultaViagem(Viagem v) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		StringBuffer sql =  new StringBuffer();
		sql.append("SELECT m.codigo, m.nome, m.naturalidade, o.placa, o.marca, o.ano, o.descricao, ");
		sql.append("v.codigo AS cod_viagem, v.onibus, v.motorista, v.hora_saida, v.hora_chegada, ");
		sql.append("v.partida, v.chegada FROM viagem v, motorista m, onibus o ");
		sql.append("WHERE v.motorista = m.codigo ");
		sql.append("AND v.onibus = o.placa");
		sql.append("AND v.codigo = ?");
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ps.setInt(1,v.getCodigoviagem());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			Motorista m = new Motorista();
			m.setCodigo(rs.getInt("codigo"));
			m.setNome(rs.getString("nome"));
			m.setNaturalidade(rs.getString("naturalidade"));
			
			Onibus o = new Onibus();
			o.setPlaca(rs.getString("placa"));
			o.setMarca(rs.getString("marca"));
			o.setAno(rs.getInt("ano"));
			o.setDescricao(rs.getString("descricao"));
			
			v.setCodigoviagem(rs.getInt("cod_viagem"));
			v.setOnibus(o);
			v.setMotorista(m);
			v.setHora_saida(rs.getInt("hora_saida"));
			v.setHora_chegada(rs.getInt("hora_chegada"));
			v.setPartida(rs.getString("partida"));
			v.setDestino(rs.getString("chegada"));
			
		}
		rs.close();
		ps.close();
		c.close();
		
		return v;
	}

	@Override
	public List<Viagem> consultaViagems() throws SQLException, ClassNotFoundException {
		List<Viagem> viagems = new ArrayList<Viagem>();
		
		Connection c = gDao.getConnection();
		StringBuffer sql =  new StringBuffer();
		sql.append("SELECT m.codigo, m.nome, m.naturalidade, o.placa, o.marca, o.ano, o.descricao, ");
		sql.append("v.codigo AS cod_viagem, v.onibus, v.motorista, v.hora_saida, v.hora_chegada, ");
		sql.append("v.partida, v.chegada FROM viagem v, motorista m, onibus o ");
		sql.append("WHERE v.motorista = m.codigo ");
		sql.append("AND v.onibus = o.placa");
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			Motorista m = new Motorista();
			m.setCodigo(rs.getInt("codigo"));
			m.setNome(rs.getString("nome"));
			m.setNaturalidade(rs.getString("naturalidade"));
			
			Onibus o = new Onibus();
			o.setPlaca(rs.getString("placa"));
			o.setMarca(rs.getString("marca"));
			o.setAno(rs.getInt("ano"));
			o.setDescricao(rs.getString("descricao"));
			
			Viagem v = new Viagem();
			v.setCodigoviagem(rs.getInt("cod_viagem"));
			v.setOnibus(o);
			v.setMotorista(m);
			v.setHora_saida(rs.getInt("hora_saida"));
			v.setHora_chegada(rs.getInt("hora_chegada"));
			v.setPartida(rs.getString("partida"));
			v.setDestino(rs.getString("chegada"));
			
			viagems.add(v);
		}
		rs.close();
		ps.close();
		c.close();
		
		return viagems;
	}

}
