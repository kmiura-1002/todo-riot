<PageTemplate>
    <div>
        <NavTemplate></NavTemplate>
        <div class='container'>
            <yield></yield>
        </div>
        <FooterTemplate></FooterTemplate>
    </div>
    <script>
        import './NavTemplate.tag'
        import './FooterTemplate.tag'
    </script>
</PageTemplate>