<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
    $this->load->library('Pdf');
    $this->load->model('M_admin');
  }

  public function barangKeluarManual2()
  {

    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // document informasi
    $pdf->SetCreator('Laboran MSMS');
    $pdf->SetTitle('Laporan Data Barang Keluar');
    $pdf->SetSubject('Barang Keluar');

    //header Data
    $pdf->SetHeaderData('akfar.jpg',30,'Laporan Data','Barang Keluar',array(203, 58, 44),array(0, 0, 0));
    $pdf->SetFooterData(array(255, 255, 255), array(255, 255, 255));


    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN,'',70));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));

    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

    //set margin
    $pdf->SetMargins(PDF_MARGIN_LEFT,PDF_MARGIN_TOP + 10,PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    $pdf->SetAutoPageBreak(FALSE, PDF_MARGIN_BOTTOM - 5);

    //SET Scaling ImagickPixel
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

    //FONT Subsetting
    $pdf->setFontSubsetting(true);

    $pdf->SetFont('helvetica','',14,'',true);

    $pdf->AddPage('L');

    $html=
      '<div>
        <h1 align="center">Invoice Bukti Pengeluaran Barang</h1>
        <p>No Id Transaksi  :</p>
        <p>Ditunjukan Untuk :</p>
        <p>Tanggal          :</p>
        <p>Po.Customer      :</p>


        <table border="1">
          <tr>
            <th style="width:40px" align="center">No</th>
            <th style="width:110px" align="center">ID Transaksi</th>
            <th style="width:110px" align="center">Tanggal Masuk</th>
            <th style="width:110px" align="center">Tanggal Keluar</th>
            <th style="width:130px" align="center">Jenis</th>
            <th style="width:140px" align="center">Kode Barang</th>
            <th style="width:140px" align="center">Nama Barang</th>
            <th style="width:80px" align="center">Satuan</th>
            <th style="width:80px" align="center">Penerima</th>
            <th style="width:80px" align="center">Jumlah</th>
          </tr>';

        $html .= '<tr>
                    <td style="height:180px"></td>
                    <td  style="height:180px"></td>
                    <td style="height:180px"></td>
                    <td style="height:180px"></td>
                    <td style="height:180px"></td>
                    <td style="height:180px"></td>
                    <td style="height:180px"></td>
                    <td style="height:180px"></td>
                    <td style="height:180px"></td>
                    <td style="height:180px"></td>
                 </tr>
                 <tr>
                  <td align="center" colspan="8">Jumlah</td>
                  <td></td>
                 </tr>';



        $html .='
            </table>
            <h6>Mengetahui</h6><br>
            <h6>Admin</h6>
          </div>';

    $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 0, 0, true, '', true);

    $pdf->Output('contoh_report.pdf','I');
  }

  public function barangKeluar()
  {
    $id = $this->uri->segment(3);
    $tgl1 = $this->uri->segment(4);
    $tgl2 = $this->uri->segment(5);
    $tgl3 = $this->uri->segment(6);
    $ls   = array('id_transaksi' => $id ,'tanggal_keluar' => $tgl1.'/'.$tgl2.'/'.$tgl3);
    $data = $this->M_admin->get_data('tb_barang_keluar',$ls);

    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // document informasi
    $pdf->SetCreator('Web Aplikasi Gudang');
    $pdf->SetTitle('Laporan Data Barang Keluar');
    $pdf->SetSubject('Barang Keluar');

    //header Data
    $pdf->SetHeaderData('akfar.jpg',30,'Laporan Bahan Keluar','AKFAR Mitra Sehat Mandiri Sidoarjo',array(203, 58, 44),array(0, 0, 0));
    $pdf->SetFooterData(array(255, 255, 255), array(255, 255, 255));


    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN,'',30));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));

    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

    //set margin
    $pdf->SetMargins(PDF_MARGIN_LEFT,PDF_MARGIN_TOP + 10,PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    $pdf->SetAutoPageBreak(FALSE, PDF_MARGIN_BOTTOM - 5);

    //SET Scaling ImagickPixel
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

    //FONT Subsetting
    $pdf->setFontSubsetting(true);

    $pdf->SetFont('helvetica','',14,'',true);

    $pdf->AddPage('L');

    $html=
      '<div>
        <h1 align="center">Bukti Pengeluaran Barang</h1><br>
        <p>No Id Transaksi  : '.$id.'</p>
        <p>Ditunjukan Untuk :</p>
        <p>Tanggal          : '.$tgl1.'/'.$tgl2.'/'.$tgl3.'</p>
        <p>Po.Customer      :</p>


        <table border="1">
          <tr>
            <th style="width:40px" align="center">No</th>
            <th style="width:110px" align="center">ID Transaksi</th>
            <th style="width:110px" align="center">Tanggal Masuk</th>
            <th style="width:110px" align="center">Tanggal Keluar</th>
            <th style="width:130px" align="center">Jenis</th>
            <th style="width:140px" align="center">Kode Barang</th>
            <th style="width:100px" align="center">Nama Barang</th>
            <th style="width:60px" align="center">Satuan</th>
            <th style="width:80px" align="center">Penerima</th>
            <th style="width:60px" align="center">Jumlah</th>
          </tr>';


          $no = 1;
          foreach($data as $d){
            $html .= '<tr>';
            $html .= '<td align="center">'.$no.'</td>';
            $html .= '<td align="center">'.$d->id_transaksi.'</td>';
            $html .= '<td align="center">'.$d->tanggal_masuk.'</td>';
            $html .= '<td align="center">'.$d->tanggal_keluar.'</td>';
            $html .= '<td align="center">'.$d->lokasi.'</td>';
            $html .= '<td align="center">'.$d->kode_barang.'</td>';
            $html .= '<td align="center">'.$d->nama_barang.'</td>';
            $html .= '<td align="center">'.$d->satuan.'</td>';
            $html .= '<td align="center">'.$d->penerima.'</td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';

            $html .= '<tr>';
            $html .= '<td align="center" colspan="9"><b>Jumlah</b></td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';
            $no++;
          }


        $html .='
            </table>
            <br>
            <h6>Mengetahui</h6>
            
            <br><br><br><br>
            <h6>Staff Laboran</h6>
          </div>';

    $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 0, 0, true, '', true);

    $pdf->Output('invoice_barang_keluar.pdf','I');

  }
public function alatperagaKeluar()
  {
    $id = $this->uri->segment(3);
    $tgl1 = $this->uri->segment(4);
    $tgl2 = $this->uri->segment(5);
    $tgl3 = $this->uri->segment(6);
    $ls   = array('id_transaksi' => $id ,'tanggal_keluar' => $tgl1.'/'.$tgl2.'/'.$tgl3);
    $data = $this->M_admin->get_data('tb_alatperaga_keluar',$ls);

    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // document informasi
    $pdf->SetCreator('Laboran Mitra Sehat Mandiri');
    $pdf->SetTitle('Laporan Data Alat Peraga Keluar');
    $pdf->SetSubject('Alat Peraga Keluar');

    //header Data
    $pdf->SetHeaderData('akfar.jpg',30,'Laporan Alat Peraga Rusak','AKFAR Mitra Sehat Mandiri Sidoarjo',array(203, 58, 44),array(0, 0, 0));
    $pdf->SetFooterData(array(255, 255, 255), array(255, 255, 255));


    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN,'',30));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));

    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

    //set margin
    $pdf->SetMargins(PDF_MARGIN_LEFT,PDF_MARGIN_TOP + 10,PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    $pdf->SetAutoPageBreak(FALSE, PDF_MARGIN_BOTTOM - 5);

    //SET Scaling ImagickPixel
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

    //FONT Subsetting
    $pdf->setFontSubsetting(true);

    $pdf->SetFont('helvetica','',12,'',true);

    $pdf->AddPage('L');

    $html=
      '<div>
        <h1 align="center">Bukti Pengeluaran Alat Peraga</h1><br>
        <p>No Id Transaksi  : '.$id.'</p>
        <p>Ditunjukan Untuk :</p>
        <p>Tanggal          : '.$tgl1.'/'.$tgl2.'/'.$tgl3.'</p>
        <p>Po.Customer      :</p>


        <table border="1">
          <tr>
            <th style="width:40px" align="center">No</th>
            <th style="width:100px" align="center">Tanggal Kerusakan</th>
            <th style="width:100px" align="center">Nama Alat</th>
            <th style="width:100px" align="center">Merk</th>
            <th style="width:100px" align="center">Kondisi</th>
            <th style="width:150px" align="center">Penjab</th>
            <th style="width:110px" align="center">NIM</th>
            <th style="width:110px" align="center">No.HP</th>
            <th style="width:65px" align="center">Jumlah</th>
          </tr>';

          $no = 1;
          foreach($data as $d){
            $html .= '<tr>';
            $html .= '<td align="center">'.$no.'</td>';
            $html .= '<td align="center">'.$d->tanggal_keluar.'</td>';
            $html .= '<td align="center">'.$d->nama_alat.'</td>';
            $html .= '<td align="center">'.$d->merk.'</td>';
            $html .= '<td align="center">'.$d->kondisi.'</td>';
            $html .= '<td align="center">'.$d->pj.'</td>';
            $html .= '<td align="center">'.$d->nim.'</td>';
            $html .= '<td align="center">'.$d->hp.'</td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';

            $html .= '<tr>';
            $html .= '<td align="center" colspan="8"><b>Jumlah</b></td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';
            $no++;
          }


        $html .='
            </table>
            
            
            <h4>Penangung Jawab</h4>
                  
             <br>
            <br>     
            <br>
            <br>
             <br>
            <br>     
            <br>
            <br>

            
            <h4>..................</h4>
            
          </div>';

    $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 0, 0, true, '', true);

    $pdf->Output('invoice_alatperaga_keluar.pdf','I');

  }
public function alatnonperagaKeluar()
  {
    $id = $this->uri->segment(3);
    $tgl1 = $this->uri->segment(4);
    $tgl2 = $this->uri->segment(5);
    $tgl3 = $this->uri->segment(6);
    $ls   = array('id_transaksi' => $id ,'tanggal_keluar' => $tgl1.'/'.$tgl2.'/'.$tgl3);
    $data = $this->M_admin->get_data('tb_alatnonperaga_keluar',$ls);

    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // document informasi
    $pdf->SetCreator('Laboran Mitra Sehat Mandiri');
    $pdf->SetTitle('Laporan Data Alat Peraga Keluar');
    $pdf->SetSubject('Alat Peraga Keluar');

    //header Data
    $pdf->SetHeaderData('akfar.jpg',30,'Laporan Alat Non Peraga Rusak','AKFAR Mitra Sehat Mandiri Sidoarjo',array(203, 58, 44),array(0, 0, 0));
    $pdf->SetFooterData(array(255, 255, 255), array(255, 255, 255));


    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN,'',30));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));

    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

    //set margin
    $pdf->SetMargins(PDF_MARGIN_LEFT,PDF_MARGIN_TOP + 10,PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    $pdf->SetAutoPageBreak(FALSE, PDF_MARGIN_BOTTOM - 5);

    //SET Scaling ImagickPixel
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

    //FONT Subsetting
    $pdf->setFontSubsetting(true);

    $pdf->SetFont('helvetica','',12,'',true);

    $pdf->AddPage('L');

    $html=
      '<div>
        <h1 align="center">Bukti Pengeluaran Alat Peraga</h1><br>
        <p>No Id Transaksi  : '.$id.'</p>
        <p>Ditunjukan Untuk :</p>
        <p>Tanggal          : '.$tgl1.'/'.$tgl2.'/'.$tgl3.'</p>
        <p>Po.Customer      :</p>


        <table border="1">
          <tr>
            <th style="width:40px" align="center">No</th>
            <th style="width:100px" align="center">Tanggal Kerusakan</th>
            <th style="width:100px" align="center">Nama Alat</th>
            <th style="width:100px" align="center">Merk</th>
            <th style="width:100px" align="center">Kondisi</th>
            <th style="width:150px" align="center">Penjab</th>
            <th style="width:110px" align="center">NIM</th>
            <th style="width:110px" align="center">No.HP</th>
            <th style="width:65px" align="center">Jumlah</th>
          </tr>';

          $no = 1;
          foreach($data as $d){
            $html .= '<tr>';
            $html .= '<td align="center">'.$no.'</td>';
            $html .= '<td align="center">'.$d->tanggal_keluar.'</td>';
            $html .= '<td align="center">'.$d->nama_alat.'</td>';
            $html .= '<td align="center">'.$d->merk.'</td>';
            $html .= '<td align="center">'.$d->kondisi.'</td>';
            $html .= '<td align="center">'.$d->pj.'</td>';
            $html .= '<td align="center">'.$d->nim.'</td>';
            $html .= '<td align="center">'.$d->hp.'</td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';

            $html .= '<tr>';
            $html .= '<td align="center" colspan="8"><b>Jumlah</b></td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';
            $no++;
          }


        $html .='
            </table>
            
            
            <h4>Penangung Jawab</h4>
                  
             <br>
            <br>     
            <br>
            <br>
             <br>
            <br>     
            <br>
            <br>

            
            <h4>..................</h4>
            
          </div>';

    $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 0, 0, true, '', true);

    $pdf->Output('invoice_alatperaga_keluar.pdf','I');

  }

public function barangKeluar2()
  {
    $id = $this->uri->segment(3);
    $tgl1 = $this->uri->segment(4);
    $tgl2 = $this->uri->segment(5);
    $tgl3 = $this->uri->segment(6);
    $data = $this->M_admin->select('tb_barang_keluar');

    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // document informasi
    $pdf->SetCreator('Aplikasi Laboran');
    $pdf->SetTitle('Recap Data Barang Keluar');
    $pdf->SetSubject('Barang Keluar');

    //header Data
    $pdf->SetHeaderData('akfar.jpg',30,'Laporan Bahan Keluar','AKFAR Mitra Sehat Mandiri Sidoarjo',array(203, 58, 44),array(0, 0, 0));
    $pdf->SetFooterData(array(255, 255, 255), array(255, 255, 255));


    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN,'',30));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));

    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

    //set margin
    $pdf->SetMargins(PDF_MARGIN_LEFT,PDF_MARGIN_TOP + 10,PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    $pdf->SetAutoPageBreak(FALSE, PDF_MARGIN_BOTTOM - 5);

    //SET Scaling ImagickPixel
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

    //FONT Subsetting
    $pdf->setFontSubsetting(true);

    $pdf->SetFont('helvetica','',10,'',true);

    $pdf->AddPage('L');

    $html=
      '<div>
        <h1 align="center">Recap Pengeluaran Barang</h1><br>
        

        <table border="1">
          <tr>
            <th style="width:40px" align="center">No</th>
            <th style="width:120px" align="center">ID Transaksi</th>
            <th style="width:110px" align="center">Tanggal Masuk</th>
            <th style="width:110px" align="center">Tanggal Keluar</th>
            <th style="width:70px" align="center">Jenis</th>
            <th style="width:110px" align="center">Kode Barang</th>
            <th style="width:110px" align="center">Nama Barang</th>
            <th style="width:60px" align="center">Satuan</th>
            <th style="width:170px" align="center">Penerima</th>
            <th style="width:60px" align="center">Jumlah</th>
          </tr>';


          $no = 1;
          foreach($data as $d){
            $html .= '<tr>';
            $html .= '<td align="center">'.$no.'</td>';
            $html .= '<td align="center">'.$d->id_transaksi.'</td>';
            $html .= '<td align="center">'.$d->tanggal_masuk.'</td>';
            $html .= '<td align="center">'.$d->tanggal_keluar.'</td>';
            $html .= '<td align="center">'.$d->lokasi.'</td>';
            $html .= '<td align="center">'.$d->kode_barang.'</td>';
            $html .= '<td align="center">'.$d->nama_barang.'</td>';
            $html .= '<td align="center">'.$d->satuan.'</td>';
            $html .= '<td align="center">'.$d->penerima.'</td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';

            $no++;
          }

          


        $html .='
            </table>
            <br>
            <h3>Mengetahui</h3>
            
            <br><br><br><br>
            <h3>Staff Laboran</h3>
          </div>';

    $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 0, 0, true, '', true);

    $pdf->Output('Recap_barang_keluar.pdf','I');

  }

public function alatnonperagaKeluar2()
  {
    $id = $this->uri->segment(3);
    $tgl1 = $this->uri->segment(4);
    $tgl2 = $this->uri->segment(5);
    $tgl3 = $this->uri->segment(6);
    $data = $this->M_admin->select('tb_alatnonperaga_keluar');

    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // document informasi
    $pdf->SetCreator('Laboran Mitra Sehat Mandiri');
    $pdf->SetTitle('Data Alat Peraga Keluar');
    $pdf->SetSubject('Alat Peraga Keluar');

    //header Data
    $pdf->SetHeaderData('akfar.jpg',30,'Laporan Alat Non Peraga Rusak','AKFAR Mitra Sehat Mandiri Sidoarjo',array(203, 58, 44),array(0, 0, 0));
    $pdf->SetFooterData(array(255, 255, 255), array(255, 255, 255));


    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN,'',30));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));

    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

    //set margin
    $pdf->SetMargins(PDF_MARGIN_LEFT,PDF_MARGIN_TOP + 10,PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    $pdf->SetAutoPageBreak(FALSE, PDF_MARGIN_BOTTOM - 5);

    //SET Scaling ImagickPixel
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

    //FONT Subsetting
    $pdf->setFontSubsetting(true);

    $pdf->SetFont('helvetica','',10,'',true);

    $pdf->AddPage('L');

    $html=
      '<div>
        <h1 align="center">Recap Pengeluaran Alat Non Peraga</h1><br>
        
        <table border="1">
          <tr>
            <th style="width:40px" align="center">No</th>
            <th style="width:100px" align="center">Tanggal Kerusakan</th>
            <th style="width:170px" align="center">Nama Alat</th>
            <th style="width:80px" align="center">Merk</th>
            <th style="width:80px" align="center">Kondisi</th>
            <th style="width:120px" align="center">Penjab</th>
            <th style="width:120px" align="center">NIM/Kelas</th>
            <th style="width:120px" align="center">No.HP</th>
            <th style="width:65px" align="center">Jumlah</th>
          </tr>';

          $no = 1;
          foreach($data as $d){
            $html .= '<tr>';
            $html .= '<td align="center">'.$no.'</td>';
            $html .= '<td align="center">'.$d->tanggal_keluar.'</td>';
            $html .= '<td align="center">'.$d->nama_alat.'</td>';
            $html .= '<td align="center">'.$d->merk.'</td>';
            $html .= '<td align="center">'.$d->kondisi.'</td>';
            $html .= '<td align="center">'.$d->pj.'</td>';
            $html .= '<td align="center">'.$d->nim.'</td>';
            $html .= '<td align="center">'.$d->hp.'</td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';

            
            $no++;
          }


        $html .='
            </table>
            
            
            <h4>Penangung Jawab</h4>
                  
             <br>
            <br>     
            <br>
            <br>
             <br>
            <br>     
            <br>
            <br>

            
            <h4>..................</h4>
            
          </div>';

    $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 0, 0, true, '', true);

    $pdf->Output('recap_alatnonperaga_keluar.pdf','I');

  }

public function alatperagaKeluar2()
  {
    $id = $this->uri->segment(3);
    $tgl1 = $this->uri->segment(4);
    $tgl2 = $this->uri->segment(5);
    $tgl3 = $this->uri->segment(6);
    $data = $this->M_admin->select('tb_alatperaga_keluar');

    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // document informasi
    $pdf->SetCreator('Laboran Mitra Sehat Mandiri');
    $pdf->SetTitle('Recap Data Alat Peraga Keluar');
    $pdf->SetSubject('Alat Peraga Keluar');

    //header Data
    $pdf->SetHeaderData('akfar.jpg',30,'Laporan Alat Peraga Rusak','AKFAR Mitra Sehat Mandiri Sidoarjo',array(203, 58, 44),array(0, 0, 0));
    $pdf->SetFooterData(array(255, 255, 255), array(255, 255, 255));


    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN,'',30));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));

    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

    //set margin
    $pdf->SetMargins(PDF_MARGIN_LEFT,PDF_MARGIN_TOP + 10,PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    $pdf->SetAutoPageBreak(FALSE, PDF_MARGIN_BOTTOM - 5);

    //SET Scaling ImagickPixel
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

    //FONT Subsetting
    $pdf->setFontSubsetting(true);

    $pdf->SetFont('helvetica','',10,'',true);

    $pdf->AddPage('L');

    $html=
      '<div>
        <h1 align="center">Recap Pengeluaran Alat Peraga</h1><br>
        

        <table border="1">
          <tr>
            <th style="width:40px" align="center">No</th>
            <th style="width:100px" align="center">Tanggal Kerusakan</th>
            <th style="width:100px" align="center">Nama Alat</th>
            <th style="width:100px" align="center">Merk</th>
            <th style="width:100px" align="center">Kondisi</th>
            <th style="width:150px" align="center">Penjab</th>
            <th style="width:110px" align="center">NIM</th>
            <th style="width:110px" align="center">No.HP</th>
            <th style="width:65px" align="center">Jumlah</th>
          </tr>';

          $no = 1;
          foreach($data as $d){
            $html .= '<tr>';
            $html .= '<td align="center">'.$no.'</td>';
            $html .= '<td align="center">'.$d->tanggal_keluar.'</td>';
            $html .= '<td align="center">'.$d->nama_alat.'</td>';
            $html .= '<td align="center">'.$d->merk.'</td>';
            $html .= '<td align="center">'.$d->kondisi.'</td>';
            $html .= '<td align="center">'.$d->pj.'</td>';
            $html .= '<td align="center">'.$d->nim.'</td>';
            $html .= '<td align="center">'.$d->hp.'</td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';

            $no++;
          }


        $html .='
            </table>
            
            
            <h4>Penangung Jawab</h4>
                  
             <br>
            <br>     
            <br>
            <br>
             <br>
            <br>     
            <br>
            <br>

            
            <h4>..................</h4>
            
          </div>';

    $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 0, 0, true, '', true);

    $pdf->Output('recap_alatperaga_keluar.pdf','I');

  }

public function alatnonperagaKembali()
  {
    $id = $this->uri->segment(3);
    $tgl1 = $this->uri->segment(4);
    $tgl2 = $this->uri->segment(5);
    $tgl3 = $this->uri->segment(6);
    $data = $this->M_admin->select('tb_alatnonperaga_kembali');

    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // document informasi
    $pdf->SetCreator('Laboran Mitra Sehat Mandiri');
    $pdf->SetTitle('Data Alat Peraga Kembali');
    $pdf->SetSubject('Alat Peraga Keluar');

    //header Data
    $pdf->SetHeaderData('akfar.jpg',30,'Laporan Alat Non Peraga Rusak','AKFAR Mitra Sehat Mandiri Sidoarjo',array(203, 58, 44),array(0, 0, 0));
    $pdf->SetFooterData(array(255, 255, 255), array(255, 255, 255));


    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN,'',30));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));

    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

    //set margin
    $pdf->SetMargins(PDF_MARGIN_LEFT,PDF_MARGIN_TOP + 10,PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    $pdf->SetAutoPageBreak(FALSE, PDF_MARGIN_BOTTOM - 5);

    //SET Scaling ImagickPixel
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

    //FONT Subsetting
    $pdf->setFontSubsetting(true);

    $pdf->SetFont('helvetica','',10,'',true);

    $pdf->AddPage('L');

    $html=
      '<div>
        <h1 align="center">Recap Pengembalian Alat Non Peraga</h1><br>
        
        <table border="1">
          <tr>
            <th style="width:40px" align="center">No</th>
            <th style="width:100px" align="center">Tanggal Kembali</th>
            <th style="width:170px" align="center">Nama Alat</th>
            <th style="width:80px" align="center">Merk</th>
            <th style="width:80px" align="center">Kondisi</th>
            <th style="width:120px" align="center">Penjab</th>
            <th style="width:120px" align="center">NIM/Kelas</th>
            <th style="width:120px" align="center">No.HP</th>
            <th style="width:65px" align="center">Jumlah</th>
          </tr>';

          $no = 1;
          foreach($data as $d){
            $html .= '<tr>';
            $html .= '<td align="center">'.$no.'</td>';
            $html .= '<td align="center">'.$d->tanggal_kembali.'</td>';
            $html .= '<td align="center">'.$d->nama_alat.'</td>';
            $html .= '<td align="center">'.$d->merk.'</td>';
            $html .= '<td align="center">'.$d->kondisi.'</td>';
            $html .= '<td align="center">'.$d->pj.'</td>';
            $html .= '<td align="center">'.$d->nim.'</td>';
            $html .= '<td align="center">'.$d->hp.'</td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';

            
            $no++;
          }


        $html .='
            </table>
            
            
            <h4>Penerima</h4>
                  
             <br>
            <br>     
            <br>
            <br>
             <br>
            <br>     
            <br>
            <br>

            
            <h4>..................</h4>
            
          </div>';

    $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 0, 0, true, '', true);

    $pdf->Output('recap_alatnonperaga_kembali.pdf','I');

  }

public function alatperagaKembali()
  {
    $id = $this->uri->segment(3);
    $tgl1 = $this->uri->segment(4);
    $tgl2 = $this->uri->segment(5);
    $tgl3 = $this->uri->segment(6);
    $data = $this->M_admin->select('tb_alatnonperaga_kembali');

    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // document informasi
    $pdf->SetCreator('Laboran Mitra Sehat Mandiri');
    $pdf->SetTitle('Data Alat Peraga Kembali');
    $pdf->SetSubject('Alat Peraga Keluar');

    //header Data
    $pdf->SetHeaderData('akfar.jpg',30,'Laporan Alat Non Peraga Rusak','AKFAR Mitra Sehat Mandiri Sidoarjo',array(203, 58, 44),array(0, 0, 0));
    $pdf->SetFooterData(array(255, 255, 255), array(255, 255, 255));


    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN,'',30));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));

    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

    //set margin
    $pdf->SetMargins(PDF_MARGIN_LEFT,PDF_MARGIN_TOP + 10,PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    $pdf->SetAutoPageBreak(FALSE, PDF_MARGIN_BOTTOM - 5);

    //SET Scaling ImagickPixel
    $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

    //FONT Subsetting
    $pdf->setFontSubsetting(true);

    $pdf->SetFont('helvetica','',10,'',true);

    $pdf->AddPage('L');

    $html=
      '<div>
        <h1 align="center">Recap Pengembalian Alat Peraga</h1><br>
        
        <table border="1">
          <tr>
            <th style="width:40px" align="center">No</th>
            <th style="width:100px" align="center">Tanggal Kembali</th>
            <th style="width:170px" align="center">Nama Alat</th>
            <th style="width:80px" align="center">Merk</th>
            <th style="width:80px" align="center">Kondisi</th>
            <th style="width:120px" align="center">Penjab</th>
            <th style="width:120px" align="center">NIM/Kelas</th>
            <th style="width:120px" align="center">No.HP</th>
            <th style="width:65px" align="center">Jumlah</th>
          </tr>';

          $no = 1;
          foreach($data as $d){
            $html .= '<tr>';
            $html .= '<td align="center">'.$no.'</td>';
            $html .= '<td align="center">'.$d->tanggal_kembali.'</td>';
            $html .= '<td align="center">'.$d->nama_alat.'</td>';
            $html .= '<td align="center">'.$d->merk.'</td>';
            $html .= '<td align="center">'.$d->kondisi.'</td>';
            $html .= '<td align="center">'.$d->pj.'</td>';
            $html .= '<td align="center">'.$d->nim.'</td>';
            $html .= '<td align="center">'.$d->hp.'</td>';
            $html .= '<td align="center">'.$d->jumlah.'</td>';
            $html .= '</tr>';

            
            $no++;
          }


        $html .='
            </table>
            
            
            <h4>Penerima</h4>
                  
             <br>
            <br>     
            <br>
            <br>
             <br>
            <br>     
            <br>
            <br>

            
            <h4>..................</h4>
            
          </div>';

    $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 0, 0, true, '', true);

    $pdf->Output('recap_alatperaga_kembali.pdf','I');

  }


}
?>
