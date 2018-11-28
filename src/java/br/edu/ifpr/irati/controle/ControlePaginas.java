/*
 * Copyright (C) 2018 Valter Estevam
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package br.edu.ifpr.irati.controle;

import br.edu.ifpr.irati.dao.Dao;
import br.edu.ifpr.irati.dao.GenericDAO;
import br.edu.ifpr.irati.dao.ItemMenuDAO;
import br.edu.ifpr.irati.modelo.ItemMenu;
import java.util.List;

/**
 *
 * @author Valter Estevam
 */
public class ControlePaginas {

    private List<ItemMenu> itens;

    public ControlePaginas() {

        ItemMenuDAO iDAO = new ItemMenuDAO();
        itens = iDAO.buscarTodos();
    }

    /**
     * @return the itens
     */
    public List<ItemMenu> getItens() {
        return itens;
    }

}
