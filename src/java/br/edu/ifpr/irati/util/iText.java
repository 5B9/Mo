/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.util;

import br.edu.ifpr.irati.controle.ControleCandidato;
import br.edu.ifpr.irati.exception.PersistenciaException;
import br.edu.ifpr.irati.modelo.Candidato;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Table;

/**
 *
 * @author Altair
 */
public class iText {

    public static void gerarPDF() {
        try {
            Document doc = new Document();
            doc.setPageSize(PageSize.A4.rotate());
            doc.setMargins(-80, -80, 10f, 0);
            doc.setMarginMirroring(true);

            Font ititulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Font imenu = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
            Font iconteudo = new Font(Font.FontFamily.HELVETICA, 12);

            ControleCandidato controleCandidato = new ControleCandidato();
            Candidato ca = new Candidato();
            List<Candidato> candidatos = controleCandidato.consultarTodosCandidatos(ca);
            String arquivoPDF = "C:\\currículos\\relatorio.pdf";

            try {
                PdfWriter.getInstance(doc, new FileOutputStream(arquivoPDF));
                doc.open();

                Image imagem = Image.getInstance("C:\\Users\\Altai\\acome\\web\\web\\imagens\\logo.png");
                imagem.scaleToFit(50, 50);
                imagem.setAlignment(1);
                doc.add(imagem);
                Paragraph prg = new Paragraph("RELATÓRIO", ititulo);
                prg.setAlignment(1);
                doc.add(prg);

                prg = new Paragraph("  ");
                doc.add(prg);

                PdfPTable tabela = new PdfPTable(9);
                tabela.getDefaultCell().setBorder(PdfPCell.NO_BORDER);

                PdfPCell célula = new PdfPCell(new Paragraph("Nome Completo:", imenu));
                célula.setBackgroundColor(BaseColor.GRAY);
                PdfPCell célula2 = new PdfPCell(new Paragraph("CPF:", imenu));
                célula2.setBackgroundColor(BaseColor.GRAY);
                PdfPCell célula3 = new PdfPCell(new Paragraph("RG:", imenu));
                célula3.setBackgroundColor(BaseColor.GRAY);
                PdfPCell célula4 = new PdfPCell(new Paragraph("Sexo:", imenu));
                célula4.setBackgroundColor(BaseColor.GRAY);
                PdfPCell célula5 = new PdfPCell(new Paragraph("Email:", imenu));
                célula5.setBackgroundColor(BaseColor.GRAY);
                PdfPCell célula6 = new PdfPCell(new Paragraph("Escolaridade:", imenu));
                célula6.setBackgroundColor(BaseColor.GRAY);
                PdfPCell célula7 = new PdfPCell(new Paragraph("Cargo Desejado:", imenu));
                célula7.setBackgroundColor(BaseColor.GRAY);
                PdfPCell célula8 = new PdfPCell(new Paragraph("Idade:", imenu));
                célula8.setBackgroundColor(BaseColor.GRAY);
                PdfPCell célula9 = new PdfPCell(new Paragraph("Formações Profissionais:", imenu));
                célula9.setBackgroundColor(BaseColor.GRAY);

                tabela.addCell(célula);
                tabela.addCell(célula2);
                tabela.addCell(célula3);
                tabela.addCell(célula4);
                tabela.addCell(célula5);
                tabela.addCell(célula6);
                tabela.addCell(célula7);
                tabela.addCell(célula8);
                tabela.addCell(célula9);

                for (Candidato c : candidatos) {
                    célula = new PdfPCell(new Paragraph(c.getNomeCompleto(), iconteudo));
                    célula2 = new PdfPCell(new Paragraph(c.getCpf(), iconteudo));
                    célula3 = new PdfPCell(new Paragraph(c.getRg(), iconteudo));
                    célula4 = new PdfPCell(new Paragraph(c.getSexo(), iconteudo));
                    célula5 = new PdfPCell(new Paragraph(c.getEnderecoEmail(), iconteudo));
                    célula6 = new PdfPCell(new Paragraph(c.getEscolaridade(), iconteudo));
                    célula7 = new PdfPCell(new Paragraph(c.getCargoDesejado(), iconteudo));
                    célula8 = new PdfPCell(new Paragraph(c.getIdade(), iconteudo));
                    célula9 = new PdfPCell(new Paragraph(c.getFormacoesProfissionais(), iconteudo));

                    tabela.addCell(célula);
                    tabela.addCell(célula2);
                    tabela.addCell(célula3);
                    tabela.addCell(célula4);
                    tabela.addCell(célula5);
                    tabela.addCell(célula6);
                    tabela.addCell(célula7);
                    tabela.addCell(célula8);
                    tabela.addCell(célula9);
                }

                doc.add(tabela);
                doc.close();
                Desktop.getDesktop().open(new File(arquivoPDF));

            } catch (Exception ex) {

            }

        } catch (PersistenciaException ex) {
            Logger.getLogger(iText.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void gerarCurriculo(int idCandidato) {
        try {
            Document doc = new Document();

            Font ititulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Font imenu = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
            Font iconteudo = new Font(Font.FontFamily.HELVETICA, 12);

            ControleCandidato controleCandidato = new ControleCandidato();
            Candidato c = controleCandidato.consultarCandidatoPorId(idCandidato);

            String arquivoPDF = "C:\\currículos\\curriculo.pdf";

            try {
                PdfWriter.getInstance(doc, new FileOutputStream(arquivoPDF));
                doc.open();
                doc.setPageSize(PageSize.A4);

                Image imagem = Image.getInstance("C:\\Users\\Altai\\acome\\web\\web\\imagens\\logo.png");
                imagem.scaleToFit(50, 50);
                imagem.setAlignment(1);
                doc.addTitle("Currículo");
                doc.add(imagem);
                Paragraph prg = new Paragraph("Currículo", ititulo);
                prg.setAlignment(1);
                doc.add(prg);

                prg = new Paragraph("  ");
                doc.add(prg);

                prg = new Paragraph("Nome Completo:" + " ", imenu);
                doc.add(prg);
                prg = new Paragraph(c.getNomeCompleto(), iconteudo);
                doc.add(prg);
                prg = new Paragraph(" ");
                doc.add(prg);
                prg = new Paragraph("CPF:" + c.getCpf(), imenu);
                doc.add(prg);
                prg = new Paragraph(c.getCpf(), iconteudo);
                doc.add(prg);
                prg = new Paragraph(" ");
                doc.add(prg);
                prg = new Paragraph("RG:", imenu);
                doc.add(prg);
                prg = new Paragraph(c.getRg(), iconteudo);
                doc.add(prg);
                prg = new Paragraph(" ");
                doc.add(prg);
                prg = new Paragraph("Sexo:", imenu);
                doc.add(prg);
                if (c.getSexo().equals("M")) {
                    prg = new Paragraph("Masculino", iconteudo);
                    doc.add(prg);
                } else {
                    prg = new Paragraph("Feminino", iconteudo);
                    doc.add(prg);
                }
                prg = new Paragraph(" ");
                doc.add(prg);
                prg = new Paragraph("Email:", imenu);
                doc.add(prg);
                prg = new Paragraph(c.getEnderecoEmail(), iconteudo);
                doc.add(prg);
                prg = new Paragraph(" ");
                doc.add(prg);
                prg = new Paragraph("Escolaridade:", imenu);
                doc.add(prg);
                prg = new Paragraph(c.getEscolaridade(), iconteudo);
                doc.add(prg);
                prg = new Paragraph(" ");
                doc.add(prg);
                prg = new Paragraph("Cargo Desejado:", imenu);
                doc.add(prg);
                prg = new Paragraph(c.getCargoDesejado(), iconteudo);
                doc.add(prg);
                prg = new Paragraph(" ");
                doc.add(prg);
                prg = new Paragraph("Idade:", imenu);
                doc.add(prg);
                prg = new Paragraph(c.getIdade(), iconteudo);
                doc.add(prg);
                prg = new Paragraph(" ");
                doc.add(prg);
                prg = new Paragraph("Formações Acadêmicas:", imenu);
                doc.add(prg);
                prg = new Paragraph(c.getFormacoesAcademicas(), iconteudo);
                doc.add(prg);
                prg = new Paragraph(" ");
                doc.add(prg);
                prg = new Paragraph("Formações Complementares:", imenu);
                doc.add(prg);
                prg = new Paragraph(c.getFormacoesComplementares(), iconteudo);
                doc.add(prg);
                prg = new Paragraph(" ");
                doc.add(prg);
                prg = new Paragraph("Atuação Profissional:", imenu);
                doc.add(prg);
                prg = new Paragraph(c.getFormacoesProfissionais(), iconteudo);
                doc.add(prg);

                doc.close();
                Desktop.getDesktop().open(new File(arquivoPDF));

            } catch (Exception ex) {

            }

        } catch (PersistenciaException ex) {
            Logger.getLogger(iText.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
