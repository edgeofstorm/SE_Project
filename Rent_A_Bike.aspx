<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Rent_A_Bike.aspx.cs" Inherits="Rent_A_Bike" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <br />
        <br />

        <!-- İlan Ver Başlık -->
        <div class="form-group">
            <div class="col-md-8">
                <h2 class="border border-dark font text-center">İlan Ver</h2>
            </div>
        </div>

        <asp:Literal ID="errorbox" runat="server"></asp:Literal><br />

        <!-- İlan Başlığı -->
        <div class="form-group">
            <label class="col-md-4 control-label " for="İlan Başlığı">İlan Başlığı</label>
            <div class="col-md-8">
                <asp:TextBox ID="ilan_baslik" runat="server" CssClass="form-control input-md"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ilan_baslik" ErrorMessage="Gerekli" ForeColor="Red" ValidationGroup="RequestVali"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="ilan_baslik" Display="Dynamic" ValidationExpression="^[a-zA-ZşŞçÇğĞİöÖüÜı''-'\s]{1,150}$" ErrorMessage="*Sadece harfler" ForeColor="Red" ValidationGroup="RequestVali"></asp:RegularExpressionValidator>
            </div>
        </div>

        <!-- İlan Açıklaması -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="">İlan Açıklaması</label>
            <div class="col-md-8">
                <asp:TextBox ID="ilan_aciklama" runat="server" CssClass="form-control input-md" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ilan_aciklama" ErrorMessage="Gerekli" ForeColor="Red" ValidationGroup="RequestVali"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="ilan_aciklama" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9şŞçÇğĞİöÖüÜı''-'\s]{1,250}$" ErrorMessage="*Sadece harfler ve sayılar" ForeColor="Red" ValidationGroup="RequestVali"></asp:RegularExpressionValidator>
            </div>
        </div>

        <!-- Marka -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Marka</label>
            <div class="col-md-8">
                <asp:TextBox ID="marka" runat="server" CssClass="form-control input-md"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="marka" ErrorMessage="Gerekli" ForeColor="Red" ValidationGroup="RequestVali"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="ilan_baslik" Display="Dynamic" ValidationExpression="^[a-zA-ZşŞçÇğĞİöÖüÜı''-'\s]{1,150}$" ErrorMessage="*Sadece harfler" ForeColor="Red" ValidationGroup="RequestVali"></asp:RegularExpressionValidator>
            </div>
        </div>

        <!-- Bisiklet Türü -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="Türü">Bisiklet Türü</label>
            <div class="col-md-8">
                <asp:DropDownList ID="tur" runat="server" CssClass="form-control" OnSelectedIndexChanged="tur_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </div>
        </div>

        <!-- Vites -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="Vites">Vites</label>
            <div class="col-md-8">
                <asp:DropDownList ID="vites" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>

        <!-- İl -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="">İl</label>
            <div class="col-md-8">
                <asp:DropDownList ID="ilBike" runat="server" OnSelectedIndexChanged="ilBike_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control input-md"></asp:DropDownList>
            </div>
        </div>

        <!-- İlçe -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="">İlçe</label>
            <div class="col-md-8">
                <asp:DropDownList ID="ilceBike" runat="server" CssClass="form-control input-md"></asp:DropDownList>
            </div>
        </div>

        <!-- Haftalık Ücret -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="Haftalık Ücret">Haftalık Ücret</label>
            <div class="col-md-8">
                <div class="input-group">
                    <asp:TextBox ID="ucret" runat="server" CssClass="form-control input-md"></asp:TextBox>
                    <div class="input-group-btn">
                        <asp:DropDownList ID="parabirim" runat="server" class="form-control">
                            <asp:ListItem Value="0" Text="₺"></asp:ListItem>
                            <asp:ListItem Value="1" Text="$"></asp:ListItem>
                            <asp:ListItem Value="2" Text="€"></asp:ListItem>
                            <asp:ListItem Value="3" Text="£"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>

        <!-- Resim Yükle -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="filebutton">Resim Ekle</label>
            <div class="col-md-8">
                <asp:FileUpload ID="resim_yukle" runat="server" CssClass="form-control input-file" AllowMultiple="False" />
            </div>
        </div>

        <!-- Şartlar ve Koşullar -->
        <div class="form-group">
            <div class="col-md-8">
                <button type="button" class="form-control" data-toggle="modal" data-target="#terms">Şartlar ve koşullar</button>
                <asp:CheckBox ID="sozlesme" runat="server" Text="" CssClass="form-control" />
            </div>
        </div>
        <div class="modal fade" id="terms" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Şart ve Kullanım Koşulları</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p class="font-weight-bold">
                            Lütfen bu İnternet Sitesini kullanmadan önce aşağıdaki Kullanım Şartlarını ve Yasal Uyarıları Dikkatle Okuyun
                        </p>
                        <p>
                            Şartların Kabul Edilmesi
                            Bu internet sitesi (“site”) PepsiCo, Inc. (“PepsiCo”) tarafından işletilmektedir. Site çapında “biz”, “bize”, “bizi” ve bizim” terimleri PepsiCo’ya atıfta bulunur. PepsiCo bu sitede mevcut olan bütün bilgiler, araçlar ve hizmetler dahil olmak üzere bu siteyi size, kullanıcıya, burada belirtilmiş bütün şartları, koşulları, politikaları ve bildirimleri kabul etmeniz şartıyla sunar. Siteyi kullanmanız bu Kullanım Şartlarını kabul etmeniz anlamına gelir. Eğer bu Kullanım Şartlarını kabul ETMİYORSANIZ, lütfen bu siteyi KULLANMAYIN.
                        </p>
                        Bilginin Doğruluğu ve Tamlığı
                        Bu sitede kullanıma sunulan bilginin doğru, tam ya da güncel olmaması halinde PepsiCo sorumlu olmayacaktır. Bu sitedeki malzeme yalnızca genel bilgi amacıyla sağlanmıştır ve öncelikli, daha doğru, daha eksiksiz veya daha güncel bilgi kaynaklarına başvurmadan karar vermek için tek temel olarak güvenilir sayılmamalı ya da kullanılmamalıdır. Herhangi bir zamanda sitenin içeriğini değiştirme hakkını saklı tutuyoruz, ama sitedeki hiçbir bilgiyi güncelleme yükümlülüğümüz yoktur. Sitedeki değişiklikleri izlemenin kendi sorumluluğunuzda olduğunu kabul edersiniz.

                        Site Kullanımınız
                        Bu sitedeki bütün içerik (metin, tasarım, grafikler, logolar, ikonlar, görüntüler, ses klipleri, indirmeler, arayüzler, kod ve yazılım dahil olmak ve bunlarla sınırlı olmamak kaydıyla) PepsiCo’nun, lisans verenlerinin veya içerik sağlayıcılarının özel mülkiyetidir ve onlara aittir ve telif hakkıyla, ticari markayla ve diğer uygulanabilen yasalarla korunur.

                        Bu site kapsamında eriştiğiniz, kopyaladığınız, indirdiğiniz ya da yazdırdığınız malzemenin üzerindeki hiçbir telif hakkını, ticari markayı ya da diğer özel bildirimi değiştirmemeniz ya da silmemeniz şartıyla kişisel, ticari olmayan kullanımınız için malzemeye erişebilir, onu kopyalayabilir, indirebilir ve yazdırabilirsiniz. Siteden elde edilen bir malzemenin, bilginin, yazılımın, ürünün ya da hizmetin değiştirilmesi, dağıtılması, aktarılması, yüklenmesi, lisanslanması ya da bunlar kullanılarak türev eserlerin yaratılması dahil ve bunlarla sınırlı olmamak kaydıyla sitedeki içeriğin bütün diğer kullanımları açıkça yasaktır. PepsiCo ya da lisans verenleri ya da servis sağlayıcıları bütün ilişkili fikri mülkiyet hakları dahil olmak üzere sitede sağlanmış malzemenin tam ve eksiksiz mülkiyet hakkını ellerinde tutar ve bu malzemeyi size PepsiCo’nun kendi takdirine göre herhangi bir anda iptal edebileceği bir lisans kapsamında sağlarlar. PepsiCo bu sitedeki malzemeleri kullanmanızın PepsiCo’ya bağlı olmayan üçüncü tarafların haklarını ihlal etmeyeceğini ne garanti ne de ifade eder.

                        Siteyi kullanmanızın bir şartı olarak, siteyi yasadışı ya da bu Kullanım Şartları’yla ya da uygulanabilen bir yasayla yasaklanmış bir amaç için kullanamazsınız.

                        Sunduğunuz Malzemeler
                        Site üzerinden sunabileceğiniz bir malzemeden bu malzemenin yasallığı, güvenilirliği, uygunluğu, özgünlüğü ve telif hakkı dahil olmak üzere sorumlu olduğunuzu kabul edersiniz. (i) gizli, özel, yanlış, sahte, iftira eden, leke düşüren, müstehcen, tehditkar, mahremiyet ya da reklam haklarına müdahale eden, fikri mülkiyet haklarını ihlal eden, kötüye kullanan, yasadışı ya da başka bir şekilde sakıncalı; (ii) suç teşkil ya da suçu teşvik edebilecek, bir tarafın haklarını ihlal edebilecek ya da başka suretle sorumluluğa yol açabilecek ya da bir yasayı ihlal edebilecek veya (iii) yazılım virüsleri, siyasi kampanya, zincirleme mektuplar, toplu postalar ya da bir “spam” türü içerebilecek bir içeriği bu siteye yükleyemez, bu site üzerinden dağıtamaz ya da başka bir suretle yayınlayamazsınız. Yanlış bir e-posta adresi ya da başka bir tanımlayıcı bilgi kullanamaz, bir kişiyi ya da varlığı taklit edemez ya da başka bir suretle bir içeriğin menşei hakkında yanlış yönlendiremezsiniz. Bu siteye ticari içerik yükleyemezsiniz.

                        Malzeme sunduğunuz ve biz aksini belirtmediğimiz takdirde PepsiCo’ya ve iştiraklerine bu malzemenin dünya çapında bir medyada kullanılması, çoğaltılması, değiştirilmesi, uyarlanması, yayımlanması, çevrilmesi, türev eserler için kullanılması, dağıtılması ve görüntülenmesi için sınırsız, özel olmayan, telifsiz, kalıcı, geri alınamaz ve tamamen alt lisanslanabilir bir hak verirsiniz. Ayrıca PepsiCo’nun sizin ya da adınıza hareket eden bireylerin PepsiCo’ya sağladığı fikirleri, kavramları, teknik bilgileri kullanmakta serbest olduğunu kabul edersiniz. PepsiCo’ya ve iştiraklerine tercih ettikleri takdirde bu malzemeyle bağlantılı olarak sunduğunuz ismi kullanma hakkını verirsiniz. Bu site vasıtasıyla sağlanan bütün kişisel bilgiler sitenin çevrimiçi Gizlilik Koşulları’na uygun olarak ele alınacaktır. Gönderdiğiniz içeriğin bütün haklarına sahip olduğunuzu ya da onları başka bir suretle kontrol ettiğinizi, içeriğin doğru olduğunu, sağladığınız içeriğin kullanılmasının bu belgedeki bir hükmü ihlal etmeyeceğini ve bir kişinin ya da varlığın zarar görmesine neden olmayacağını ve PepsiCo’yu sağladığınız içerikten kaynaklanan bütün hak talepleri için tazmin edeceğinizi ifade ve garanti edersiniz.

                        Yasal Uyarılar
                        Bu siteyi kullanırken risk sadece size aittir. Site “olduğu gibi” esasıyla sağlanmaktadır.

                        PepsiCo zımni ticarete elverişlilik, özel bir amaç için uygunluk ya da ihlal etmeme garantisi dahil ve bunlarla sınırlı olmamak üzere bu Siteyle ilgili herhangi bir malzemeye ilişkin sarih ya da zımni herhangi bir türdeki garantiyi açıkça inkar eder.

                        Bu siteden bir malzeme indirirseniz, takdir yetkisi ve risk size aittir. Bu malzemeyi indirmeniz sonucu bilgisayar sisteminizin görebileceği zarardan ya da kaybedebileceğiniz verilerden siz sorumlu olursunuz.

                        Sorumluluğun Sınırlandırılması
                        PEPSICO HAKSIZ FİİL, SÖZLEŞME, KUSURSUZ SORUMLULUK KAPSAMINDA YA DA BAŞKA BİR SURETTE OLSUN, HİÇBİR DURUMDA VE HİÇBİR YASAL YA DA ADİL TEORİ KAPSAMINDA BU SİTE KAPSAMINDAKİ BİLGİNİN KULLANIMINDAN KAYNAKLANAN, KAYBEDİLEN KARLAR İÇİN TAZMİNATLAR, İYİ NİYET KAYBI, VERİ KAYBI, İŞ DURMASI, SONUÇLARIN DOĞRULUĞU, BİLGİSAYAR ARIZASI YA DA HATASI DAHİL VE BUNLARLA SINIRLI OLMAMAK ÜZERE DOĞRUDAN, DOLAYLI, ÖZEL, TESADÜFİ YA DA TALİ HASARLARDAN SORUMLU OLMAYACAKTIR.

                        HEM PEPSICO’NUN HEM DE TEDARİKÇİLERİNİN SİTENİN BİR KULLANICISININ İFTİRA EDEN, SALDIRGAN YA DA YASADIŞI HAREKETİNDEN SORUMLU OLMAYACAĞINI ÖZEL OLARAK TASDİK VE KABUL EDERSİNİZ. YUKARIDAKİ HAK TALEPLERİNDEN HERHANGİ BİRİ YA DA PEPSICO İLE BİR ANLAŞMAZLIK İÇİN TEK VE ÖZEL HUKUKİ YOLUNUZ SİTEYİ KULLANMAYI BIRAKMAKTIR. SİZ VE PEPSICO SİTEDEN ORTAYA ÇIKAN YA DA SİTEYLE İLGİLİ HUKUKİ SEBEBİN, HUKUKİ SEBEBİN TAHAKKUK ETMESİNDEN YA DA HUKUKİ SEBEBİN KALICI OLARAK ENGELLENMESİNDEN SONRAKİ BİR (1) YIL İÇİNDE BAŞLAMASI GEREKTİĞİNİ KABUL EDERSİNİZ. BAZI ADLİ YETKİLER ZIMNİ GARANTİNİN DEVAM SÜRESİNİN SINIRLANDIRILMASINA YA DA TALİ VEYA TESADÜFİ HASARLAR İÇİN SORUMLULUĞUN HARİÇ TUTULMASINA YA DA SINIRLANDIRILMASINA İZİN VERMEDİĞİ İÇİN, YUKARIDAKİ SINIRLAMANIN TAMAMI YA DA BİR KISMI SİZİN İÇİN GEÇERLİ OLMAYABİLİR.

                        Tazminat
                        Siteyi kullanmanızdan kaynaklanan ve bununla ilgili avukat ücretleri dahil olmak üzere bütün hak talepleri, hasarlar, maliyetler ve harcamalara ilişkin PepsiCo’yu savunmayı, tazmin etmeyi ve sorumlu tutmamayı kabul edersiniz.

                        Telif Hakkı Bildirimi
                        Aksi belirtilmediği sürece, bu Site kapsamındaki grafik görüntüleri, düğmeler ve metin PepsiCo’nun ve iştiraklerinin özel mülkiyetidir. Bu kalemler kişisel kullanım dışında PepsiCo’nun önceden yazılı izni olmadan elektronik, mekanik, fotokopi, kayıt ya da başka bir surette olsun herhangi bir biçimde, herhangi bir yolla kopyalanamaz, dağıtılamaz, görüntülenemez, çoğaltılamaz ve aktarılamaz.

                        Ticari Markalar
                        Bu site PepsiCo’nun ve iştiraklerinin ya da lisans verenlerinin ya da içerik sağlayıcılarının mülkiyeti olan ya da onlara lisanslanmış logoları, marka kimliklerini ve diğer ticari markaları ve hizmet markalarını (topluca “Markalar”) içerir. Bu Markaların hepsi ilgili sahiplerinin mülkiyetidir. Bu Site kapsamındaki hiçbir şey dolaylı olarak, önceden yapılan beyanın değiştirilmesinin yasaklanması yoluyla, ya da başka bir suretle bu Sitede görüntülenen bir Markayı PepsiCo’nun ya da Sitede görüntülenen bir Markanın sahibi olabilecek başka bir üçüncü tarafın yazılı izni olmadan kullanmak için bir lisans ya da hak verme şeklinde yorumlanmamalıdır. PepsiCo sitede ve içeriğinde ve siteye ve içeriğine açıkça verilmemiş bütün hakları saklı tutar. Bu site ve metin, tasarım, grafikler, arayüzler ve kod dahil fakat bunlarla sınırlı olmamak üzere içeriğinin tamamı ve bunların seçilmesi ve düzenlenmesi Amerika Birleşik Devletleri’nin ve diğer ülkelerin telif hakkı kanunları kapsamında bir derleme olarak korunur.

                        Üçüncü Taraf Sitelerine Bağlantılar
                        Site kullanıcılara kolaylık olarak üçüncü tarafların sahip olduğu ve işlettiği, PepsiCo’nun sürdürmediği diğer sitelere bağlantı verebilir. Ancak, bu üçüncü taraflar PepsiCo’ya bağlı olsalar bile, PepsiCo’nun bu bağlantı verilmiş siteler üzerinde bir kontrolü yoktur ve bu sitelerin tamamının PepsiCo’dan bağımsız ayrı gizlilik ve veri toplama uygulamaları ve yasal politikaları vardır. PepsiCo bağlantı verilen sitelerin içeriklerinden sorumlu değildir ve bu sitelerdeki malzemenin içeriği ya da doğruluğuyla ilgili hiçbir fikir belirtmez. Bu üçüncü taraf sitelerini ziyaretinizde risk tamamen size aittir.

                        İleriye Dönük İfadelerle İlgili İhtiyatlı Dil
                        Bu site ABD federal menkul kıymetler kanunlarında tanımlandığı üzere “ileriye dönük ifade” teşkil eden ifadeler, tahminler veya öngörüler içerebilir. Böyle ileriye dönük ifadeler doğal olarak spekülatiftir ve gelecekteki olaylar ve eğilimler hakkında o anda mevcut bilgileri, işletim planlarını ve öngörüleri temel alır. Bu itibarla birçok riske ve belirsizliğe tabidirler. Gerçek sonuçlar ve performans PepsiCo’nun geçmişteki deneyiminden ve bizim mevcut beklentilerimizden veya öngörülerimizden önemli ölçüde farklı olabilir. PepsiCo ileriye dönük ifadeleri kamusal olarak güncellemek ya da gözden geçirmek için bir yükümlülük taahhüdünde bulunmaz.

                        Adli Yetki
                        PepsiCo bu Siteyi Amerika Birleşik Devletleri’nin New York eyaletindeki ofisinden sürdürür ve işletir. Bu Kullanım Şartları Amerika Birleşik Devletleri’nin New York Eyaleti’nin kanunlarına tabidir ve onlar kapsamında yorumlanır. Bu siteyi kullanarak bu Kullanım Şartları’ndan kaynaklanan bir işlem için New York’ta bulunan mahkemelerin adli yetkisini kabul edersiniz. Eğer bu Kullanım Şartları’nın bir kısmı yasadışı, geçersiz, ya da yürürlüğe koyulamaz sayılırsa, o kısım ayrılabilir sayılacak ve uygulanabilen yasaya göre yorumlanacaktır. Bu şart kalan hükümlerden hiçbirinin geçerliliğini ve yürürlüğe koyulabilirliğini etkilemeyecektir. PepsiCo’nun Sizin ya da başkalarının bu Kullanım Şartları’nı ihlal etmesiyle ilgili olarak harekete geçmemesi bir feragat teşkil etmez ve PepsiCo’nun bu ihlal veya sonraki ihlallerle ilgili haklarını sınırlamayacaktır.
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- İlan ver -->
        <div class="form-group">
            <div class="col-md-4">
                <asp:Button runat="server" ID="ilan_ver" Text="İlan Ver" CssClass="btn btn-dark" OnClick="ilan_ver_Click" ValidationGroup="RequestVali"></asp:Button>
            </div>
        </div>
    </div>

</asp:Content>

