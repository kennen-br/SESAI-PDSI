if InfrastructureBuildingType.count == 0
    InfrastructureBuildingType.create!([
        { name: 'Sede do DSEI' },
        { name: 'CASAI' },
        { name: 'Sede de Polo Base Tipo 1' },
        { name: 'Sede de Polo Base Tipo 2' },
        { name: 'UBSI' }
    ])
end

if Dsei.count == 0
  Dsei.create!([
    {name: "ALAGOAS E SERGIPE", sesai_id:  1 },
    {name: "ALTAMIRA", sesai_id:  2 },
    {name: "ALTO RIO JURUÁ", sesai_id:  3 },
    {name: "ALTO RIO NEGRO", sesai_id:  4 },
    {name: "ALTO RIO PURUS", sesai_id:  5 },
    {name: "ALTO RIO SOLIMÕES", sesai_id:  6 },
    {name: "AMAPÁ E NORTE DO PARÁ", sesai_id:  7 },
    {name: "ARAGUAIA", sesai_id:  8 },
    {name: "BAHIA", sesai_id:  9 },
    {name: "CEARÁ", sesai_id:  10  },
    {name: "CUIABÁ", sesai_id:  11  },
    {name: "GUAMÁ-TOCANTINS", sesai_id:  12  },
    {name: "INTERIOR SUL", sesai_id:  13  },
    {name: "KAIAPÓ DO MATO GROSSO", sesai_id:  14  },
    {name: "KAIAPÓ DO PARÁ", sesai_id:  15  },
    {name: "LESTE DE RORAIMA", sesai_id:  16  },
    {name: "LITORAL SUL", sesai_id:  17  },
    {name: "MANAUS", sesai_id:  18  },
    {name: "MARANHÃO", sesai_id:  19  },
    {name: "MATO GROSSO DO SUL", sesai_id:  20  },
    {name: "MÉDIO RIO PURUS", sesai_id:  21  },
    {name: "MÉDIO RIO SOLIMÕES E AFLUENTES", sesai_id:  22  },
    {name: "MINAS GERAIS E ESPÍRITO SANTO", sesai_id:  23  },
    {name: "PARINTINS", sesai_id:  24  },
    {name: "PERNAMBUCO", sesai_id:  25  },
    {name: "PORTO VELHO", sesai_id:  26  },
    {name: "POTIGUARA", sesai_id:  27  },
    {name: "RIO TAPAJÓS", sesai_id:  28  },
    {name: "TOCANTINS", sesai_id:  29  },
    {name: "VALE DO JAVARI", sesai_id:  30  },
    {name: "VILHENA", sesai_id:  31  },
    {name: "XAVANTE", sesai_id:  32  },
    {name: "XINGU", sesai_id:  33  },
    {name: "YANOMAMI", sesai_id:  34  },
    {name: "SESAI CENTRAL", sesai_id:  35  }
  ])
end

# BasePolo Seeds
if BasePolo.count == 0
  BasePolo.create!([
    {dsei_id: 1, name: "KARIRI-XOKÓ", sesai_id: 1588},
    {dsei_id: 1, name: "KARAPOTÓ PLAKI-Ô", sesai_id: 1873},
    {dsei_id: 1, name: "KALANKÓ", sesai_id: 1527},
    {dsei_id: 1, name: "XUCURU-KARIRI", sesai_id: 1592},
    {dsei_id: 1, name: "KARAPOTÓ TERRA NOVA", sesai_id: 1872},
    {dsei_id: 1, name: "WASSU COCAL", sesai_id: 1591},
    {dsei_id: 1, name: "XOKÓ", sesai_id: 1587},
    {dsei_id: 1, name: "TINGUI BOTÓ", sesai_id: 1589},
    {dsei_id: 1, name: "JERIPANKÓ", sesai_id: 1870},
    {dsei_id: 1, name: "KARUAZU-KATOKINN", sesai_id: 1871},
    {dsei_id: 1, name: "ACONÃ", sesai_id: 1601},
    {dsei_id: 1, name: "KOIUPANKÁ", sesai_id: 1602},
    {dsei_id: 2, name: "ALTAMIRA", sesai_id: 1680},
    {dsei_id: 3, name: "MANCIO LIMA", sesai_id: 1513},
    {dsei_id: 3, name: "JORDAO", sesai_id: 1516},
    {dsei_id: 3, name: "MARECHAL THAUMATURGO", sesai_id: 1515},
    {dsei_id: 3, name: "FEIJÓ", sesai_id: 1570},
    {dsei_id: 3, name: "TARAUACÁ", sesai_id: 1572},
    {dsei_id: 3, name: "CRUZEIRO DO SUL", sesai_id: 1569},
    {dsei_id: 3, name: "PORTO WALTER", sesai_id: 1514},
    {dsei_id: 4, name: "TAPERERA", sesai_id: 1819},
    {dsei_id: 4, name: "YAUARETÊ", sesai_id: 1631},
    {dsei_id: 4, name: "NAZARÉ DO ENUIXÍ", sesai_id: 1535},
    {dsei_id: 4, name: "CARURU - UAUPÉS", sesai_id: 1560},
    {dsei_id: 4, name: "ESTRADA", sesai_id: 1531},
    {dsei_id: 4, name: "CUCUÍ", sesai_id: 1817},
    {dsei_id: 4, name: "TUNUÍ-CACHOEIRA", sesai_id: 1721},
    {dsei_id: 4, name: "PARI-CACHOEIRA", sesai_id: 1815},
    {dsei_id: 4, name: "SÃO JOSÉ II", sesai_id: 1814},
    {dsei_id: 4, name: "PATOS", sesai_id: 1816},
    {dsei_id: 4, name: "ILHA DAS FLORES", sesai_id: 1532},
    {dsei_id: 4, name: "TARACUÁ", sesai_id: 1813},
    {dsei_id: 4, name: "CUMATÍ", sesai_id: 1812},
    {dsei_id: 4, name: "SERRINHA", sesai_id: 1533},
    {dsei_id: 4, name: "CARURU - TIQUIÉ", sesai_id: 1559},
    {dsei_id: 4, name: "MASSARABÍ", sesai_id: 1534},
    {dsei_id: 4, name: "TUCUMÃ", sesai_id: 1722},
    {dsei_id: 4, name: "CAUBURIS", sesai_id: 1538},
    {dsei_id: 4, name: "MÉDIO UAUPÉS", sesai_id: 1563},
    {dsei_id: 4, name: "JURUTI", sesai_id: 1818},
    {dsei_id: 4, name: "SÃO JOAQUIM", sesai_id: 1810},
    {dsei_id: 4, name: "CANADÁ", sesai_id: 1811},
    {dsei_id: 4, name: "CAMARÃO", sesai_id: 1520},
    {dsei_id: 4, name: "CUMARÚ", sesai_id: 1536},
    {dsei_id: 4, name: "TAPERA", sesai_id: 1537},
    {dsei_id: 5, name: "SANTA ROSA", sesai_id: 1687},
    {dsei_id: 5, name: "PAUINI", sesai_id: 1739},
    {dsei_id: 5, name: "BOCA DO ACRE", sesai_id: 1571},
    {dsei_id: 5, name: "MANOEL URBANO", sesai_id: 1735},
    {dsei_id: 5, name: "ASSIS BRASIL", sesai_id: 1774},
    {dsei_id: 5, name: "SENA MADUREIRA", sesai_id: 1773},
    {dsei_id: 6, name: "SÃO PAULO DE OLIVENÇA", sesai_id: 1565},
    {dsei_id: 6, name: "BELÉM DO SOLIMÕES", sesai_id: 1629},
    {dsei_id: 6, name: "BETÂNIA", sesai_id: 1677},
    {dsei_id: 6, name: "TONANTINS", sesai_id: 1679},
    {dsei_id: 6, name: "NOVA ITÁLIA", sesai_id: 1678},
    {dsei_id: 6, name: "VENDAVAL", sesai_id: 1630},
    {dsei_id: 6, name: "CAMPO ALEGRE", sesai_id: 1676},
    {dsei_id: 6, name: "FEIJOAL", sesai_id: 1675},
    {dsei_id: 6, name: "FILADÉLFIA", sesai_id: 1567},
    {dsei_id: 6, name: "UMARIAÇÚ II", sesai_id: 1556},
    {dsei_id: 6, name: "UMARIAÇÚ I", sesai_id: 1566},
    {dsei_id: 6, name: "VILA BITENCOURT", sesai_id: 1876},
    {dsei_id: 7, name: "MANGA", sesai_id: 1748},
    {dsei_id: 7, name: "BONA", sesai_id: 1717},
    {dsei_id: 7, name: "ARAMIRÃ", sesai_id: 1719},
    {dsei_id: 7, name: "MISSÃO TIRIYÓ", sesai_id: 1718},
    {dsei_id: 7, name: "KUMENÊ", sesai_id: 1747},
    {dsei_id: 7, name: "KUMARUMÃ", sesai_id: 1746},
    {dsei_id: 8, name: "CONFRESA", sesai_id: 1858},
    {dsei_id: 8, name: "SÃO FÉLIX DO ARAGUAIA", sesai_id: 1542},
    {dsei_id: 8, name: "SANTA TEREZINHA", sesai_id: 1539},
    {dsei_id: 8, name: "GOIÂNIA", sesai_id: 1857},
    {dsei_id: 9, name: "ITAMARAJU", sesai_id: 1887},
    {dsei_id: 9, name: "PAULO AFONSO", sesai_id: 1786},
    {dsei_id: 9, name: "IBOTIRAMA", sesai_id: 1730},
    {dsei_id: 9, name: "ILHÉUS", sesai_id: 1785},
    {dsei_id: 9, name: "EUCLIDES DA CUNHA", sesai_id: 1886},
    {dsei_id: 9, name: "PORTO SEGURO", sesai_id: 1787},
    {dsei_id: 9, name: "JUAZEIRO", sesai_id: 1636},
    {dsei_id: 9, name: "PAU BRASIL", sesai_id: 1888},
    {dsei_id: 9, name: "RIBEIRA DO POMBAL", sesai_id: 1885},
    {dsei_id: 9, name: "FEIRA DE SANTANA", sesai_id: 1729},
    {dsei_id: 10, name: "MONSENHOR TABOSA", sesai_id: 1608},
    {dsei_id: 10, name: "CRATEÚS", sesai_id: 1616},
    {dsei_id: 10, name: "CAUCAIA", sesai_id: 1725},
    {dsei_id: 10, name: "ITAREMA", sesai_id: 1797},
    {dsei_id: 10, name: "MARACANAÚ", sesai_id: 1726},
    {dsei_id: 10, name: "ARATUBA", sesai_id: 1614},
    {dsei_id: 10, name: "PORANGA", sesai_id: 1610},
    {dsei_id: 10, name: "AQUIRAZ", sesai_id: 1594},
    {dsei_id: 10, name: "SÃO BENEDITO", sesai_id: 1879},
    {dsei_id: 11, name: "TANGARÁ DA SERRA", sesai_id: 1761},
    {dsei_id: 11, name: "BRASNORTE", sesai_id: 1762},
    {dsei_id: 11, name: "CUIABÁ", sesai_id: 1760},
    {dsei_id: 11, name: "RONDONÓPOLIS", sesai_id: 1759},
    {dsei_id: 11, name: "CHIQUITANO", sesai_id: 1756},
    {dsei_id: 12, name: "ORIXIMINA", sesai_id: 1824},
    {dsei_id: 12, name: "PARAGOMINAS", sesai_id: 1528},
    {dsei_id: 12, name: "MARABÁ", sesai_id: 1738},
    {dsei_id: 12, name: "TUCURUÍ", sesai_id: 1749},
    {dsei_id: 12, name: "TOMÉ-AÇU", sesai_id: 1529},
    {dsei_id: 12, name: "CAPITÃO POÇO", sesai_id: 1750},
    {dsei_id: 12, name: "SANTA LUZIA DO PARÁ", sesai_id: 1637},
    {dsei_id: 12, name: "SANTARÉM", sesai_id: 1522},
    {dsei_id: 13, name: "PASSO FUNDO", sesai_id: 1743},
    {dsei_id: 13, name: "GUARAPUAVA", sesai_id: 1744},
    {dsei_id: 13, name: "BAURÚ", sesai_id: 1745},
    {dsei_id: 13, name: "JOSÉ BOITEUX", sesai_id: 1511},
    {dsei_id: 13, name: "GUAÍRA", sesai_id: 1883},
    {dsei_id: 13, name: "CHAPECÓ", sesai_id: 1510},
    {dsei_id: 13, name: "LONDRINA", sesai_id: 1742},
    {dsei_id: 13, name: "SANTA HELENA", sesai_id: 1884},
    {dsei_id: 14, name: "PEIXOTO DE AZEVEDO", sesai_id: 1574},
    {dsei_id: 14, name: "JUARA", sesai_id: 1593},
    {dsei_id: 14, name: "SEDE DO DSEI KAIAPÓ DO MT", sesai_id: 1595},
    {dsei_id: 15, name: "TUCUMÃ", sesai_id: 1575},
    {dsei_id: 15, name: "OURILÂNDIA", sesai_id: 1576},
    {dsei_id: 15, name: "REDENÇÃO", sesai_id: 1757},
    {dsei_id: 15, name: "SÃO FÉLIX DO XINGU", sesai_id: 1605},
    {dsei_id: 16, name: "JACAMIM", sesai_id: 1694},
    {dsei_id: 16, name: "MATURUCA", sesai_id: 1632},
    {dsei_id: 16, name: "CAMARA", sesai_id: 1649},
    {dsei_id: 16, name: "CARAPARU I", sesai_id: 1654},
    {dsei_id: 16, name: "PEDRA PRETA", sesai_id: 1656},
    {dsei_id: 16, name: "BARRO", sesai_id: 1621},
    {dsei_id: 16, name: "VISTA ALEGRE", sesai_id: 1666},
    {dsei_id: 16, name: "SERRA DO SOL", sesai_id: 1658},
    {dsei_id: 16, name: "WILIMON", sesai_id: 1653},
    {dsei_id: 16, name: "MORRO", sesai_id: 1652},
    {dsei_id: 16, name: "CARACANÃ", sesai_id: 1517},
    {dsei_id: 16, name: "ARAÇÁ", sesai_id: 1519},
    {dsei_id: 16, name: "SOROCAIMA II", sesai_id: 1668},
    {dsei_id: 16, name: "PEDREIRA", sesai_id: 1622},
    {dsei_id: 16, name: "JATAPUZINHO", sesai_id: 1695},
    {dsei_id: 16, name: "MATIRI", sesai_id: 1661},
    {dsei_id: 16, name: "CANTAGALO", sesai_id: 1647},
    {dsei_id: 16, name: "MILHO", sesai_id: 1518},
    {dsei_id: 16, name: "MALACACHETA", sesai_id: 1669},
    {dsei_id: 16, name: "CONSTANTINO", sesai_id: 1651},
    {dsei_id: 16, name: "BOQUEIRÃO", sesai_id: 1623},
    {dsei_id: 16, name: "RAPOSA I", sesai_id: 1660},
    {dsei_id: 16, name: "SANTA MARIA", sesai_id: 1650},
    {dsei_id: 16, name: "SERRA DO TRUARÚ", sesai_id: 1696},
    {dsei_id: 16, name: "SANTA CRUZ", sesai_id: 1662},
    {dsei_id: 16, name: "PIUM", sesai_id: 1665},
    {dsei_id: 16, name: "PEDRA BRANCA", sesai_id: 1655},
    {dsei_id: 16, name: "MANOA", sesai_id: 1670},
    {dsei_id: 16, name: "SÃO FRANCISCO", sesai_id: 1564},
    {dsei_id: 16, name: "PONTA DA SERRA", sesai_id: 1663},
    {dsei_id: 16, name: "CAMPO FORMOSO", sesai_id: 1657},
    {dsei_id: 16, name: "SANTA INÊS", sesai_id: 1664},
    {dsei_id: 16, name: "BISMARCK", sesai_id: 1659},
    {dsei_id: 16, name: "ROÇA", sesai_id: 1667},
    {dsei_id: 17, name: "MIRACATU", sesai_id: 1784},
    {dsei_id: 17, name: "OSÓRIO", sesai_id: 1603},
    {dsei_id: 17, name: "PARANAGUÁ", sesai_id: 1508},
    {dsei_id: 17, name: "REGISTRO", sesai_id: 1691},
    {dsei_id: 17, name: "MONGAGUÁ", sesai_id: 1562},
    {dsei_id: 17, name: "VIAMÃO", sesai_id: 1690},
    {dsei_id: 17, name: "RIO SILVEIRA", sesai_id: 1731},
    {dsei_id: 17, name: "FLORIANÓPOLIS", sesai_id: 1509},
    {dsei_id: 17, name: "ARAQUARI", sesai_id: 1693},
    {dsei_id: 17, name: "SÃO PAULO", sesai_id: 1688},
    {dsei_id: 17, name: "PERUÍBE", sesai_id: 1568},
    {dsei_id: 17, name: "ANGRA DOS REIS", sesai_id: 1633},
    {dsei_id: 17, name: "PORTO ALEGRE", sesai_id: 1512},
    {dsei_id: 17, name: "UBATUBA", sesai_id: 1689},
    {dsei_id: 17, name: "BARRA DO RIBEIRO", sesai_id: 1863},
    {dsei_id: 18, name: "PONTA NATAL", sesai_id: 1855},
    {dsei_id: 18, name: "MANAQUIRI", sesai_id: 1620},
    {dsei_id: 18, name: "MANACAPURU", sesai_id: 1619},
    {dsei_id: 18, name: "BOCA DO JAUARI", sesai_id: 1854},
    {dsei_id: 18, name: "IGAPÓ AÇÚ", sesai_id: 1852},
    {dsei_id: 18, name: "MAKIRA (NOVA JERUSALÉM)", sesai_id: 1848},
    {dsei_id: 18, name: "URUCARÁ", sesai_id: 1618},
    {dsei_id: 18, name: "LARANJAL", sesai_id: 1853},
    {dsei_id: 18, name: "NOSSA SENHORA DA SAÚDE", sesai_id: 1849},
    {dsei_id: 18, name: "MUNICÍPIO DE BERURI", sesai_id: 1847},
    {dsei_id: 18, name: "MURUTINGA", sesai_id: 1583},
    {dsei_id: 18, name: "KWATÁ", sesai_id: 1851},
    {dsei_id: 18, name: "RIO PRETO DA EVA", sesai_id: 1875},
    {dsei_id: 18, name: "PANTALEÃO", sesai_id: 1582},
    {dsei_id: 18, name: "CAREIRO CASTANHO", sesai_id: 1856},
    {dsei_id: 18, name: "ANAMÃ", sesai_id: 1882},
    {dsei_id: 19, name: "ARAME", sesai_id: 1728},
    {dsei_id: 19, name: "BARRA DO CORDA", sesai_id: 1524},
    {dsei_id: 19, name: "AMARANTE", sesai_id: 1523},
    {dsei_id: 19, name: "ZÉ DOCA", sesai_id: 1525},
    {dsei_id: 19, name: "GRAJAÚ", sesai_id: 1732},
    {dsei_id: 19, name: "SANTA INÊS", sesai_id: 1777},
    {dsei_id: 20, name: "AMAMBAÍ", sesai_id: 1682},
    {dsei_id: 20, name: "TACURU", sesai_id: 1736},
    {dsei_id: 20, name: "DOURADOS", sesai_id: 1758},
    {dsei_id: 20, name: "MIRANDA", sesai_id: 1776},
    {dsei_id: 20, name: "PARANHOS", sesai_id: 1684},
    {dsei_id: 20, name: "CAMPO GRANDE", sesai_id: 1754},
    {dsei_id: 20, name: "AQUIDAUANA", sesai_id: 1775},
    {dsei_id: 20, name: "SIDROLÂNDIA", sesai_id: 1755},
    {dsei_id: 20, name: "ANTÔNIO JOÃO", sesai_id: 1558},
    {dsei_id: 20, name: "BODOQUENA", sesai_id: 1740},
    {dsei_id: 20, name: "BONITO", sesai_id: 1671},
    {dsei_id: 20, name: "IGUATEMI", sesai_id: 1741},
    {dsei_id: 20, name: "CAARAPÓ", sesai_id: 1683},
    {dsei_id: 20, name: "CORUMBÁ", sesai_id: 1639},
    {dsei_id: 20, name: "BRASILÂNDIA", sesai_id: 1638},
    {dsei_id: 21, name: "TAWAMIRIM", sesai_id: 1699},
    {dsei_id: 21, name: "CHICO CAMILO", sesai_id: 1544},
    {dsei_id: 21, name: "IMINAÃ", sesai_id: 1705},
    {dsei_id: 21, name: "TUMIÃ", sesai_id: 1704},
    {dsei_id: 21, name: "CRISPIM", sesai_id: 1701},
    {dsei_id: 21, name: "ABAQUADI", sesai_id: 1698},
    {dsei_id: 21, name: "CASA NOVA", sesai_id: 1702},
    {dsei_id: 21, name: "MARRECÃO", sesai_id: 1697},
    {dsei_id: 21, name: "SÃO PEDRO", sesai_id: 1703},
    {dsei_id: 21, name: "JAPIIM", sesai_id: 1700},
    {dsei_id: 22, name: "BARREIRA DA MISSÃO", sesai_id: 1712},
    {dsei_id: 22, name: "BIÁ", sesai_id: 1778},
    {dsei_id: 22, name: "IPIXUNA", sesai_id: 1781},
    {dsei_id: 22, name: "CUIÚ-CUIÚ", sesai_id: 1709},
    {dsei_id: 22, name: "EIRUNEPÉ", sesai_id: 1714},
    {dsei_id: 22, name: "MARAJAÍ", sesai_id: 1713},
    {dsei_id: 22, name: "BUGAIO", sesai_id: 1711},
    {dsei_id: 22, name: "MUCURA", sesai_id: 1641},
    {dsei_id: 22, name: "COARI", sesai_id: 1640},
    {dsei_id: 22, name: "MORADA NOVA", sesai_id: 1715},
    {dsei_id: 22, name: "KUMARÚ", sesai_id: 1716},
    {dsei_id: 22, name: "BUÁ-BUÁ", sesai_id: 1710},
    {dsei_id: 22, name: "UARINI", sesai_id: 1642},
    {dsei_id: 22, name: "ENVIRA", sesai_id: 1780},
    {dsei_id: 22, name: "CARAUARÍ", sesai_id: 1779},
    {dsei_id: 23, name: "CARMÉSIA", sesai_id: 1685},
    {dsei_id: 23, name: "CAIERAS VELHA", sesai_id: 1506},
    {dsei_id: 23, name: "PRADINHO", sesai_id: 1505},
    {dsei_id: 23, name: "BREJO MATA FOME", sesai_id: 1634},
    {dsei_id: 23, name: "BELA VISTA", sesai_id: 1573},
    {dsei_id: 23, name: "SUMARÉ", sesai_id: 1672},
    {dsei_id: 23, name: "RANCHARIA", sesai_id: 1673},
    {dsei_id: 23, name: "PINDAÍBA", sesai_id: 1859},
    {dsei_id: 23, name: "ITAPICURU", sesai_id: 1860},
    {dsei_id: 23, name: "CAPÃO DO ZEZINHO", sesai_id: 1861},
    {dsei_id: 23, name: "CAMPANÁRIO", sesai_id: 1878},
    {dsei_id: 23, name: "RESPLENDOR", sesai_id: 1686},
    {dsei_id: 23, name: "LADAINHA", sesai_id: 1625},
    {dsei_id: 23, name: "ITAPECERICA", sesai_id: 1881},
    {dsei_id: 23, name: "ÁGUA BOA", sesai_id: 1674},
    {dsei_id: 23, name: "ARAÇUAÍ", sesai_id: 1550},
    {dsei_id: 23, name: "TOPÁZIO", sesai_id: 1867},
    {dsei_id: 23, name: "COMBOIOS", sesai_id: 1507},
    {dsei_id: 23, name: "ARACRUZ", sesai_id: 1889},
    {dsei_id: 23, name: "MACHACALIS", sesai_id: 1890},
    {dsei_id: 23, name: "SÃO JOÃO DAS MISSÕES", sesai_id: 1891},
    {dsei_id: 23, name: "TEÓFILO OTONI", sesai_id: 1892},
    {dsei_id: 24, name: "SANTA MARIA", sesai_id: 1841},
    {dsei_id: 24, name: "NOVA ESPERANÇA", sesai_id: 1837},
    {dsei_id: 24, name: "VILA NOVA II", sesai_id: 1839},
    {dsei_id: 24, name: "ARATICUM", sesai_id: 1820},
    {dsei_id: 24, name: "KURUATUBA", sesai_id: 1822},
    {dsei_id: 24, name: "VILA NOVA I", sesai_id: 1823},
    {dsei_id: 24, name: "NOVA ALDEIA", sesai_id: 1840},
    {dsei_id: 24, name: "CUMINAPANEMA", sesai_id: 1825},
    {dsei_id: 24, name: "RIOZINHO", sesai_id: 1828},
    {dsei_id: 24, name: "NOVA ALEGRIA", sesai_id: 1842},
    {dsei_id: 24, name: "UMIRITUBA", sesai_id: 1821},
    {dsei_id: 24, name: "KASSAWÁ", sesai_id: 1826},
    {dsei_id: 25, name: "ATIKUM", sesai_id: 1723},
    {dsei_id: 25, name: "TRUKÁ", sesai_id: 1724},
    {dsei_id: 25, name: "PIPIPAN", sesai_id: 1727},
    {dsei_id: 25, name: "FULNI-Ô", sesai_id: 1681},
    {dsei_id: 25, name: "KAMBIWÁ-TUXÁ", sesai_id: 1877},
    {dsei_id: 25, name: "PANKARÁ", sesai_id: 1737},
    {dsei_id: 25, name: "XUKURU DO ORORUBÁ", sesai_id: 1598},
    {dsei_id: 25, name: "PANKARARU", sesai_id: 1599},
    {dsei_id: 25, name: "PANKARURU ENTRE SERRAS", sesai_id: 1783},
    {dsei_id: 25, name: "KAMBIWÁ", sesai_id: 1597},
    {dsei_id: 25, name: "KAPINAWÁ", sesai_id: 1596},
    {dsei_id: 25, name: "XUKURU DE CIMBRES", sesai_id: 1782},
    {dsei_id: 26, name: "JI-PARANÁ", sesai_id: 1733},
    {dsei_id: 26, name: "ALTA FLORESTA", sesai_id: 1734},
    {dsei_id: 26, name: "HUMAITÁ", sesai_id: 1720},
    {dsei_id: 26, name: "GUAJARÁ MIRIM", sesai_id: 1526},
    {dsei_id: 26, name: "PORTO VELHO", sesai_id: 1692},
    {dsei_id: 27, name: "MARCAÇÃO", sesai_id: 1752},
    {dsei_id: 27, name: "BAÍA DA TRAIÇÃO", sesai_id: 1751},
    {dsei_id: 27, name: "RIO TINTO", sesai_id: 1753},
    {dsei_id: 28, name: "MISSÃO CURURU", sesai_id: 1844},
    {dsei_id: 28, name: "SAI CINZA", sesai_id: 1827},
    {dsei_id: 28, name: "NOVO PROGRESSO", sesai_id: 1628},
    {dsei_id: 28, name: "RESTINGA", sesai_id: 1845},
    {dsei_id: 28, name: "KATÕ", sesai_id: 1829},
    {dsei_id: 28, name: "JACAREACANGA", sesai_id: 1548},
    {dsei_id: 28, name: "CAROÇAL DO RIO DAS TROPAS", sesai_id: 1846},
    {dsei_id: 28, name: "TELES PIRES", sesai_id: 1834},
    {dsei_id: 28, name: "WARO APAMPU(POSTO MDK)", sesai_id: 1843},
    {dsei_id: 28, name: "SANTA MARIA", sesai_id: 1832},
    {dsei_id: 28, name: "ITAITUBA", sesai_id: 1838},
    {dsei_id: 29, name: "SANTA FE DO ARAGUAIA", sesai_id: 1541},
    {dsei_id: 29, name: "TOCANTINÓPOLIS", sesai_id: 1865},
    {dsei_id: 29, name: "FORMOSO DO ARAGUAIA", sesai_id: 1864},
    {dsei_id: 29, name: "TOCANTÍNIA", sesai_id: 1862},
    {dsei_id: 29, name: "ITACAJÁ", sesai_id: 1866},
    {dsei_id: 30, name: "MÉDIO JAVARI", sesai_id: 1789},
    {dsei_id: 30, name: "ALTO ITUÍ", sesai_id: 1793},
    {dsei_id: 30, name: "MÉDIO ITUÍ", sesai_id: 1792},
    {dsei_id: 30, name: "MÉDIO CURUÇA", sesai_id: 1561},
    {dsei_id: 30, name: "ITACOAÍ", sesai_id: 1791},
    {dsei_id: 30, name: "SEDE DO DSEI VALE DO JAVARI", sesai_id: 1795},
    {dsei_id: 30, name: "JAQUIRANA", sesai_id: 1790},
    {dsei_id: 30, name: "ALTO CURUÇÁ", sesai_id: 1794},
    {dsei_id: 31, name: "VILHENA", sesai_id: 1806},
    {dsei_id: 31, name: "CACOAL", sesai_id: 1809},
    {dsei_id: 31, name: "JUÍNA", sesai_id: 1807},
    {dsei_id: 31, name: "ARIPUANÃ", sesai_id: 1808},
    {dsei_id: 32, name: "SÃO MARCOS", sesai_id: 1802},
    {dsei_id: 32, name: "SANGRADOURO", sesai_id: 1607},
    {dsei_id: 32, name: "CAMPINÁPOLIS", sesai_id: 1803},
    {dsei_id: 32, name: "ÁGUA BOA", sesai_id: 1805},
    {dsei_id: 32, name: "PARANATINGA", sesai_id: 1804},
    {dsei_id: 32, name: "MARÃIWATSEDE", sesai_id: 1606},
    {dsei_id: 33, name: "PAVURÚ", sesai_id: 1800},
    {dsei_id: 33, name: "LEONARDO", sesai_id: 1799},
    {dsei_id: 33, name: "WAWI", sesai_id: 1604},
    {dsei_id: 33, name: "DIAUARUM", sesai_id: 1801},
    {dsei_id: 34, name: "URARICOERA", sesai_id: 1644},
    {dsei_id: 34, name: "AJURICABA", sesai_id: 1543},
    {dsei_id: 34, name: "ERICÓ", sesai_id: 1530},
    {dsei_id: 34, name: "PARAFURI", sesai_id: 1772},
    {dsei_id: 34, name: "XITEI", sesai_id: 1771},
    {dsei_id: 34, name: "MARAUIÁ", sesai_id: 1579},
    {dsei_id: 34, name: "AUARIS", sesai_id: 1768},
    {dsei_id: 34, name: "BALAWAU", sesai_id: 1584},
    {dsei_id: 34, name: "MALOCA PAAPIU", sesai_id: 1555},
    {dsei_id: 34, name: "PAAPIU", sesai_id: 1767},
    {dsei_id: 34, name: "SURUCUCU", sesai_id: 1600},
    {dsei_id: 34, name: "NOVO-DEMINI", sesai_id: 1707},
    {dsei_id: 34, name: "HAKOMA", sesai_id: 1788},
    {dsei_id: 34, name: "TOOTOTOBI", sesai_id: 1646},
    {dsei_id: 34, name: "PALIMIÚ", sesai_id: 1770},
    {dsei_id: 34, name: "MISSÃO CATRIMANI", sesai_id: 1766},
    {dsei_id: 34, name: "HAXIU", sesai_id: 1581},
    {dsei_id: 34, name: "ALTO PADAUIRI", sesai_id: 1577},
    {dsei_id: 34, name: "ALTO MUCAJAI", sesai_id: 1635},
    {dsei_id: 34, name: "MARARI", sesai_id: 1706},
    {dsei_id: 34, name: "ARACÁ", sesai_id: 1708},
    {dsei_id: 34, name: "HOMOXI", sesai_id: 1645},
    {dsei_id: 34, name: "MAIA", sesai_id: 1554},
    {dsei_id: 34, name: "WAIKÁS", sesai_id: 1769},
    {dsei_id: 34, name: "MATURACÁ", sesai_id: 1552},
    {dsei_id: 34, name: "BAIXO MUCAJAI", sesai_id: 1643},
    {dsei_id: 34, name: "MÉDIO PADAUIRI", sesai_id: 1578},
    {dsei_id: 34, name: "SAUBA", sesai_id: 1868},
    {dsei_id: 34, name: "ALTO CATRIMANI", sesai_id: 1764},
    {dsei_id: 34, name: "DEMINI", sesai_id: 1585},
    {dsei_id: 34, name: "BAIXO CATRIMANI", sesai_id: 1765},
    {dsei_id: 34, name: "WAPUTHA", sesai_id: 1869},
    {dsei_id: 34, name: "ARATHA-U", sesai_id: 1551},
    {dsei_id: 34, name: "APIAÚ", sesai_id: 1557},
    {dsei_id: 34, name: "INAMBÚ", sesai_id: 1553},
    {dsei_id: 34, name: "AJARANI", sesai_id: 1763},
    {dsei_id: 34, name: "CACHOEIRA DO ARAÇÁ", sesai_id: 1580}
  ])
end

# VILLAGE Seeds
if Village.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'villages.seed.csv')
  sql = <<-COPY_PSQL
    COPY villages(base_polo_id, name, sesai_id, city_name, city_sesai_id, created_at, updated_at)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

if Ethnicity.count == 0
  # ETHNICITY Seeds
  seed_path = File.join(Rails.root, 'db', 'seeds', 'ethnicities.seed.csv')
  sql = <<-COPY_PSQL
    COPY ethnicities(name , sesai_id, created_at, updated_at)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)

  # ETHNICITY_VILLAGE Seeds
  seed_path = File.join(Rails.root, 'db', 'seeds', 'ethnicities_villages.seed.csv')
  sql = <<-COPY_PSQL
    COPY ethnicities_villages(ethnicity_id, village_id)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end


# PEOPLE Seeds
if People.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'people.seed.csv')
  sql = <<-COPY_PSQL
    COPY people(dsei_id, is_sesai_central, name, location, bond, created_at, updated_at)
      FROM '#{seed_path}'
      WITH
        DELIMITER ','
        NULL 'null'
        CSV
          HEADER
    COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

# InvestmentPoleBase Seeds
if InvestmentPoleBase.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'investment_pole_base.seed.csv')
  sql = <<-COPY_PSQL
    COPY investment_pole_bases(name, created_at, updated_at)
      FROM '#{seed_path}'
      WITH
        DELIMITER ','
        NULL 'null'
        CSV
          HEADER
    COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

# InvestmentCity Seeds
if InvestmentCity.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'investment_cities.seed.csv')
  sql = <<-COPY_PSQL
    COPY investment_cities(name, created_at, updated_at)
      FROM '#{seed_path}'
      WITH
        DELIMITER ','
        NULL 'null'
        CSV
          HEADER
    COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

# InvestmentVillage Seeds
if InvestmentVillage.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'investment_villages.seed.csv')
  sql = <<-COPY_PSQL
    COPY investment_villages(name, created_at, updated_at)
      FROM '#{seed_path}'
      WITH
        DELIMITER ','
        NULL 'null'
        CSV
          HEADER
    COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

if UserType.count == 0
  UserType.create!([
    {name: "Administrador"},
    {name: "Visitante SESAI Central"},
    {name: "Gestor SESAI Central"},
    {name: "Visitante DSEI"},
    {name: "Gestor DSEI"},
  ])
end

if User.count == 0
  User.create!([
    #USUÁRIO ADMINISTRATIVO
    { username: "AD0001", password: 'Rapadura1234!@#$', user_type: UserType.first,           active: true, profile: Profile.new(name: 'Administrador') },
    #USUÁRIO SESAI
    { username: "US0001", password: 'Rapadura1234!@#$', user_type: UserType.second,          active: true, profile: Profile.new(name: 'Usuário de consultas da SESAI Central') },
    { username: "OS0001", password: 'Rapadura1234!@#$', user_type: UserType.first(3).last,    active: true, profile: Profile.new(name: 'Operador da SESAI Central') },
    #USUÁRIO DSEI
    { username: "UD0001", password: 'Rapadura1234!@#$', user_type: UserType.first(4).last,    active: true, profile: Profile.new(name: 'Usuário de consultas ALTO RIO JURUÁ'), dsei: Dsei.find(3) },
    #OPERADORES DSEI
    { username: "OD0001", password: 'Rapadura1234!@#$', user_type:UserType.first(5).last, active:true, profile:Profile.new(name: 'ALAGOAS E SERGIPE'), dsei: Dsei.find(1) },
    { username: "OD0002", password: 'Rapadura1234!@#$', user_type:UserType.first(6).last, active:true, profile:Profile.new(name: 'ALTAMIRA'), dsei: Dsei.find(2) },
    { username: "OD0003", password: 'Rapadura1234!@#$', user_type:UserType.first(7).last, active:true, profile:Profile.new(name: 'ALTO RIO JURUÁ'), dsei: Dsei.find(3) },
    { username: "OD0004", password: 'Rapadura1234!@#$', user_type:UserType.first(8).last, active:true, profile:Profile.new(name: 'ALTO RIO NEGRO'), dsei: Dsei.find(4) },
    { username: "OD0005", password: 'Rapadura1234!@#$', user_type:UserType.first(9).last, active:true, profile:Profile.new(name: 'ALTO RIO PURUS'), dsei: Dsei.find(5) },
    { username: "OD0006", password: 'Rapadura1234!@#$', user_type:UserType.first(10).last, active:true, profile:Profile.new(name: 'ALTO RIO SOLIMÕES'), dsei: Dsei.find(6) },
    { username: "OD0007", password: 'Rapadura1234!@#$', user_type:UserType.first(11).last, active:true, profile:Profile.new(name: 'AMAPÁ E NORTE DO PARÁ'), dsei: Dsei.find(7) },
    { username: "OD0008", password: 'Rapadura1234!@#$', user_type:UserType.first(12).last, active:true, profile:Profile.new(name: 'ARAGUAIA'), dsei: Dsei.find(8) },
    { username: "OD0009", password: 'Rapadura1234!@#$', user_type:UserType.first(13).last, active:true, profile:Profile.new(name: 'BAHIA'), dsei: Dsei.find(9) },
    { username: "OD0010", password: 'Rapadura1234!@#$', user_type:UserType.first(14).last, active:true, profile:Profile.new(name: 'CEARÁ'), dsei: Dsei.find(10) },
    { username: "OD0011", password: 'Rapadura1234!@#$', user_type:UserType.first(15).last, active:true, profile:Profile.new(name: 'CUIABÁ'), dsei: Dsei.find(11) },
    { username: "OD0012", password: 'Rapadura1234!@#$', user_type:UserType.first(16).last, active:true, profile:Profile.new(name: 'GUAMÁ-TOCANTINS'), dsei: Dsei.find(12) },
    { username: "OD0013", password: 'Rapadura1234!@#$', user_type:UserType.first(17).last, active:true, profile:Profile.new(name: 'INTERIOR SUL'), dsei: Dsei.find(13) },
    { username: "OD0014", password: 'Rapadura1234!@#$', user_type:UserType.first(18).last, active:true, profile:Profile.new(name: 'KAIAPÓ DO MATO GROSSO'), dsei: Dsei.find(14) },
    { username: "OD0015", password: 'Rapadura1234!@#$', user_type:UserType.first(19).last, active:true, profile:Profile.new(name: 'KAIAPÓ DO PARÁ'), dsei: Dsei.find(15) },
    { username: "OD0016", password: 'Rapadura1234!@#$', user_type:UserType.first(20).last, active:true, profile:Profile.new(name: 'LESTE DE RORAIMA'), dsei: Dsei.find(16) },
    { username: "OD0017", password: 'Rapadura1234!@#$', user_type:UserType.first(21).last, active:true, profile:Profile.new(name: 'LITORAL SUL'), dsei: Dsei.find(17) },
    { username: "OD0018", password: 'Rapadura1234!@#$', user_type:UserType.first(22).last, active:true, profile:Profile.new(name: 'MANAUS'), dsei: Dsei.find(18) },
    { username: "OD0019", password: 'Rapadura1234!@#$', user_type:UserType.first(23).last, active:true, profile:Profile.new(name: 'MARANHÃO'), dsei: Dsei.find(19) },
    { username: "OD0020", password: 'Rapadura1234!@#$', user_type:UserType.first(24).last, active:true, profile:Profile.new(name: 'MATO GROSSO DO SUL'), dsei: Dsei.find(20) },
    { username: "OD0021", password: 'Rapadura1234!@#$', user_type:UserType.first(25).last, active:true, profile:Profile.new(name: 'MÉDIO RIO PURUS'), dsei: Dsei.find(21) },
    { username: "OD0022", password: 'Rapadura1234!@#$', user_type:UserType.first(26).last, active:true, profile:Profile.new(name: 'MÉDIO RIO SOLIMÕES E AFLUENTES'), dsei: Dsei.find(22) },
    { username: "OD0023", password: 'Rapadura1234!@#$', user_type:UserType.first(27).last, active:true, profile:Profile.new(name: 'MINAS GERAIS E ESPÍRITO SANTO'), dsei: Dsei.find(23) },
    { username: "OD0024", password: 'Rapadura1234!@#$', user_type:UserType.first(28).last, active:true, profile:Profile.new(name: 'PARINTINS'), dsei: Dsei.find(24) },
    { username: "OD0025", password: 'Rapadura1234!@#$', user_type:UserType.first(29).last, active:true, profile:Profile.new(name: 'PERNAMBUCO'), dsei: Dsei.find(25) },
    { username: "OD0026", password: 'Rapadura1234!@#$', user_type:UserType.first(30).last, active:true, profile:Profile.new(name: 'PORTO VELHO'), dsei: Dsei.find(26) },
    { username: "OD0027", password: 'Rapadura1234!@#$', user_type:UserType.first(31).last, active:true, profile:Profile.new(name: 'POTIGUARA'), dsei: Dsei.find(27) },
    { username: "OD0028", password: 'Rapadura1234!@#$', user_type:UserType.first(32).last, active:true, profile:Profile.new(name: 'RIO TAPAJÓS'), dsei: Dsei.find(28) },
    { username: "OD0029", password: 'Rapadura1234!@#$', user_type:UserType.first(33).last, active:true, profile:Profile.new(name: 'TOCANTINS'), dsei: Dsei.find(29) },
    { username: "OD0030", password: 'Rapadura1234!@#$', user_type:UserType.first(34).last, active:true, profile:Profile.new(name: 'VALE DO JAVARI'), dsei: Dsei.find(30) },
    { username: "OD0031", password: 'Rapadura1234!@#$', user_type:UserType.first(35).last, active:true, profile:Profile.new(name: 'VILHENA'), dsei: Dsei.find(31) },
    { username: "OD0032", password: 'Rapadura1234!@#$', user_type:UserType.first(36).last, active:true, profile:Profile.new(name: 'XAVANTE'), dsei: Dsei.find(32) },
    { username: "OD0033", password: 'Rapadura1234!@#$', user_type:UserType.first(37).last, active:true, profile:Profile.new(name: 'XINGU'), dsei: Dsei.find(33) },
    { username: "OD0034", password: 'Rapadura1234!@#$', user_type:UserType.first(38).last, active:true, profile:Profile.new(name: 'YANOMAMI'), dsei: Dsei.find(34) }

])
end

if Pdsi.count == 0
    Pdsi.create!([
      { id: 1, dsei_id:1, user_id: User.find(5)},
      { id: 2, dsei_id:2, user_id: User.find(6)},
      { id: 3, dsei_id:3, user_id: User.find(7)},
      { id: 4, dsei_id:4, user_id: User.find(8)},
      { id: 5, dsei_id:5, user_id: User.find(9)},
      { id: 6, dsei_id:6, user_id: User.find(10)},
      { id: 7, dsei_id:7, user_id: User.find(11)},
      { id: 8, dsei_id:8, user_id: User.find(12)},
      { id: 9, dsei_id:9, user_id: User.find(13)},
      { id: 10, dsei_id:10, user_id: User.find(14)},
      { id: 11, dsei_id:11, user_id: User.find(15)},
      { id: 12, dsei_id:12, user_id: User.find(16)},
      { id: 13, dsei_id:13, user_id: User.find(17)},
      { id: 14, dsei_id:14, user_id: User.find(18)},
      { id: 15, dsei_id:15, user_id: User.find(19)},
      { id: 16, dsei_id:16, user_id: User.find(20)},
      { id: 17, dsei_id:17, user_id: User.find(21)},
      { id: 18, dsei_id:18, user_id: User.find(22)},
      { id: 19, dsei_id:19, user_id: User.find(23)},
      { id: 20, dsei_id:20, user_id: User.find(24)},
      { id: 21, dsei_id:21, user_id: User.find(25)},
      { id: 22, dsei_id:22, user_id: User.find(26)},
      { id: 23, dsei_id:23, user_id: User.find(27)},
      { id: 24, dsei_id:24, user_id: User.find(28)},
      { id: 25, dsei_id:25, user_id: User.find(29)},
      { id: 26, dsei_id:26, user_id: User.find(30)},
      { id: 27, dsei_id:27, user_id: User.find(31)},
      { id: 28, dsei_id:28, user_id: User.find(32)},
      { id: 29, dsei_id:29, user_id: User.find(33)},
      { id: 30, dsei_id:30, user_id: User.find(34)},
      { id: 31, dsei_id:31, user_id: User.find(35)},
      { id: 32, dsei_id:32, user_id: User.find(36)},
      { id: 33, dsei_id:33, user_id: User.find(37)},
      { id: 34, dsei_id:34, user_id: User.find(38)}
    ])
end

# pdsi_base_polo_data Seeds
if PdsiBasePoloDatum.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'pdsi_base_polo_data.seed.csv')
  sql = <<-COPY_PSQL
    COPY pdsi_base_polo_data(pdsi_id, base_polo_id, city_name, created_at, updated_at)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

if Cost.count == 0
  Cost.create!([
    { name: 'MATERIAL MÉDICO HOSPITALAR (MMH)', id: 1 ,ask_distribution: true, data_type: 'money', cost_type: 3 },
    { name: 'CUSTEIO DE SANEAMENTO', id: 2, ask_distribution: true, data_type: 'money' , cost_type: 3},
    { name: 'CUSTEIO DE EDIFICAÇÕES', id: 3, ask_distribution: true, data_type: 'money' , cost_type: 3},
    { name: 'SATELITAL', id: 4, ask_distribution: true, data_type: 'money' , cost_type: 3},
    { name: 'PASSAGENS E DIÁRIAS (SCDP)', id: 5, ask_distribution: false, data_type: 'money', cost_type: 3 },
    { name: 'CONVÊNIOS PARA CONTRATAÇÃO DE RECURSOS HUMANOS', id: 6, ask_distribution: true, data_type: 'money', cost_type: 3 },
    { name: 'MEDICAMENTOS', id: 7, ask_distribution: false, data_type: 'money', cost_type: 3 },
    { name: 'SERVIDORES PÚBLICO FEDERAIS', id: 8, ask_distribution: true, data_type: 'money', cost_type: 3 },
    { name: 'COMBUSTÍVEL', id: 9, ask_distribution: true, data_type: 'money', cost_type: 3 },
    { name: 'CONTRATOS', id: 10, ask_distribution: true, data_type: 'money', cost_type: 1 },
    { name: 'ALIMENTAÇÃO', id: 11, ask_distribution: true, data_type: 'money', parent_id: 10, cost_type: 2 },
    { name: '3.3.90.30.07 - Gêneros de Alimentação', id: 12, ask_distribution: true, data_type: 'money', parent_id: 11, cost_type: 3 },
    { name: '3.3.90.36.23 - Fornecimento de Alimentação (Outros Serviços de Terceiros - Pessoa Física)', id: 13, ask_distribution: true, data_type: 'money', parent_id: 11, cost_type: 3 },
    { name: '3.3.90.39.41 - Fornecimento de Alimentação (Outros Serviço de Terceiros - Pessoa Jurídica)', id: 14, ask_distribution: true, data_type: 'money', parent_id: 11, cost_type: 3 },
    { name: 'HORAS VÔO', id: 15, ask_distribution: false, data_type: 'money', parent_id: 10, cost_type: 2 },
    { name: '3.3.90.33.03 - Horas Vôo', id: 16, ask_distribution: true, data_type: 'money', parent_id: 15, cost_type: 3 },
    { name: 'LOCAÇÃO DE VEÍCULOS', id: 17, ask_distribution: true, data_type: 'money', parent_id: 10 , cost_type: 2},
    { name: '3.3.90.33.03 - Locação de Veículos', id: 18, ask_distribution: true, data_type: 'money', parent_id: 17, cost_type: 3 },
    { name: '3.3.90.33.05 - Locomoção Urbana', id: 19, ask_distribution: true, data_type: 'money', parent_id: 17 , cost_type: 3},
    { name: '3.3.90.33.09 - Transporte de Servidores', id: 20, ask_distribution: true, data_type: 'money', parent_id: 17 , cost_type: 3},
    { name: 'LOCAÇÃO DE MÃO DE OBRA', id: 21, ask_distribution: true, data_type: 'money', parent_id: 10 , cost_type: 2},
    { name: '3.3.90.37.01 - Secretária e Recepcionista', id: 22, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.01 - Motorista', id: 23, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.01 - Barqueiro', id: 24, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.01 - Artíficie', id: 25, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.02 - Limpeza e Conservação', id: 26, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.03 - Vigilância Ostensiva', id: 27, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.05 - Serviço de Copa e Cozinha ', id: 28, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.06 - Manutenção e Conservação de Bens Movéis', id: 29, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: 'OUTROS CONTRATOS', id: 30, ask_distribution: false, data_type: 'money', parent_id: 10 , cost_type: 2},
    { name: '3.3.90.30.03 - Combustíveis e Outros Materiais Lubrificantes', id: 31, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.04 - Gás e Outros Materiais Engarrafados', id: 32, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.14 - Material Educativo e Esportivo', id: 33, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.16 - Material de Expediente', id: 34, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.17 - Material de Processamento de Dados', id: 35, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.19 - Material de Acondicionamento e Embalagem', id: 36, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.20 - Material de Cama, Mesa e Banho', id: 37, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.21 - Material de Copa e Cozinha', id: 38, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.22 - Material de Limpeza e Prod. de Higienização', id: 39, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.23 - Uniformes, Tercidos e Aviamentos', id: 40, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.25 - Material p/Manutenção de Bens Móveis', id: 41, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.26 - Material Elétrico e Eletrônico', id: 42, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.28 - Material de Proteção e Segurança', id: 43, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.34 - Sobressal. Máq. e Motores, Navios e Embarcações', id: 44, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.90.30.39 - Material p/ Manutenção de Veículos', id: 45, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.42 - Ferramentas', id: 46, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.44 - Material de Sinalização Visual e Outros', id: 47, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.33.03 - Embarcação Fluvial', id: 48, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.33.08 - Pedágios', id: 49, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.36.06 - Serviços Técnicos Profissionais', id: 50, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.36.15 - Locação de Imóveis', id: 51, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.36.16 - Locação de Bens Móveis e Intangíveis', id: 52, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.90.36.17 - Tributos a Conta do Locatário ou Cessionário ', id: 53, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.90.36.35 - Serviço de Apoio Administrativo, Técnico e Operacional', id: 54, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.36.46 - Diárias a Conselheiros', id: 55, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.36.80 - Hospedagens', id: 56, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.90.39.01 - Assinatura de Periódicos e Anuidade', id: 57, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.90.39.05 - Serviços Técnicos Profissionais', id: 58, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.08 - Manutenção de Software', id: 59, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.09 - Armazenagem', id: 60, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.10 - Locação de Imóveis', id: 61, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.11 - Locação de Software', id: 62, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.70 - Confecções de Uniformes, Bandeiras e Flâmulas', id: 63, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.74 - Fretes e Transp. de Encomendas  ', id: 64, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.75 - Serviço de Incineração, Destruição e Demolição', id: 65, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.78 - Limpeza e Conservação', id: 66, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.80 - Hospedagens', id: 67, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.83 - Serviços de Cópias e Reprodução de Documentos', id: 68, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.95 - Manutenção e Conserv. Equip. de Processamento de dados', id: 69, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.97 - Comunicação de Dados', id: 70, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.91.39.01 - Assinaturas e Periódicos e Anuidades', id: 71, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.91.39.47 - Serviços de Comunicação em Geral ', id: 72, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.91.39.90 - Serviços de Publicidade Legal', id: 73, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3}
  ])
end

#{ name: 'GÊNEROS DE ALIMENTAÇÃO', ask_distribution: true, data_type: 'money', parent_id: 11 },
#{ name: 'FORNECIMENTO DE ALIMENTAÇÃO', ask_distribution: true, data_type: 'money', parent_id: 11 },
#{ name: 'APOIO ADMINISTRATIVO, TÉCNICO E OPERACIONAL', ask_distribution: true, data_type: 'money', parent_id: 14 },
#{ name: 'LIMPEZA E CONSERVAÇÃO', ask_distribution: true, data_type: 'money', parent_id: 14 },
#{ name: 'VIGILÂNCIA OSTENSIVA', ask_distribution: true, data_type: 'money', parent_id: 14 },
#{ name: 'MANUTENÇÃO E CONSERVAÇÃO DE BENS IMÓVEIS', ask_distribution: true, data_type: 'money', parent_id: 14 },
#{ name: 'SERVIÇO DE COPA E COZINHA', ask_distribution: true, data_type: 'money', parent_id: 14 },
#{ name: 'SECRETÁRIA, RECEPCIONISTA', ask_distribution: true, data_type: 'money', parent_id: 18 },
#{ name: 'MOTORISTA', ask_distribution: true, data_type: 'money', parent_id: 18 },
#{ name: 'BARQUEIRO', ask_distribution: true, data_type: 'money', parent_id: 18 },
#{ name: 'ARTÍFICE', ask_distribution: true, data_type: 'money', parent_id: 18 },

if AbsoluteDatumLevel.count == 0
  AbsoluteDatumLevel.create!([
    {name: "Polo Base"},
    {name: "CASAI"},
    {name: "DSEI"}
  ])
end

if AbsoluteDatum.count == 0
  AbsoluteDatum.create!([
    {absolute_datum_level_id: 1, name: "NÚMERO DE ÓBITOS MATERNOS EM 2014"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE NASCIDOS VIVOS EM 2014"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE MENORES DE 1 ANO COM ATENDIMENTO"},
    {absolute_datum_level_id: 1, name: "POPULAÇÃO DE MENORES DE 1 ANO"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS QUE RECEBERAM AÇÕES DE EDUCAÇÃO EM SAÚDE"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ÓBITOS DE MENORES DE 1 ANO INVESTIGADOS EM 2014"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ÓBITOS DE MENORES DE 1 ANO EM 2014"},
    {absolute_datum_level_id: 1, name: "NÚMERO TOTAL DE ÓBITOS MATERNOS INVESTIGADOS EM 2014"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ENCAMINHAMENTOS PARA AS CASAI DE CASOS SENSÍVEIS À ATENÇÃO BÁSICA"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ENCAMINHAMENTOS PARA AS CASAI"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM ACESSO A ÁGUA TRATADA"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM SISTEMAS DE ABASTECIMENTO DE ÁGUA (SAA)"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM SAA COM MQAI IMPLANTADOS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM SAA"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM SAA IMPLANTADOS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM DESTINO ADEQUADO DE DEJETOS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM DESTINO ADEQUADO DE RESÍDUOS SÓLIDOS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE MÉDICOS EM EMSI, POLOS BASE E CASAIS"},
    {absolute_datum_level_id: 1, name: "POPULAÇÃO TOTAL"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE EMSI COMPLETAS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE EMSI"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE PROFISSIONAIS DO SASISUS EM EDUCAÇÃO PERMANENTE"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE PROFISSIONAIS DO SASISUS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS DE 50 A 250 INDÍGENAS COBERTAS POR UBSI"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS DE 50 A 250 INDÍGENAS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS DE 251 A 500 INDÍGENAS COBERTAS POR UBSI"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS DE 251 A 500 INDÍGENAS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM MAIS DE 501 INDÍGENAS COBERTAS POR UBSI"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM MAIS DE 501 INDÍGENAS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE CONSULTÓRIOS FIXOS E PORTÁTEIS EM FUNCIONAMENTO"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE CONSULTÓRIOS FIXOS E PORTÁTEIS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ESTABELECIMENTOS QUE POSSUEM REDE LÓGICA E INTERNET EM FUNCIONAMENTO"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ESTABELECIMENTOS (SEDE, PÓLOS BASE, CASAI, UBSI)"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ESTABELECIMENTOS COM SIASI EM FUNCIONAMENTO"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ESTABELECIMENTOS COM HÓRUS EM OPERAÇÃO"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ESTABELECIMENTOS DE SAÚDE NO CNES"},
    {absolute_datum_level_id: 2, name: "NÚMERO DE DIAS DE PERMANÊNCIA DOS USUÁRIOS NAS CASAI EM 2014"},
    {absolute_datum_level_id: 2, name: "NÚMERO DE USUÁRIOS DAS CASAI EM 2014"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE REUNIÕES ORDINÁRIAS DO CONDISI REALIZADAS EM 2015"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE REUNIÕES ORDINÁRIAS PROGRAMADAS EM 2015"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE REUNIÕES ORDINÁRIAS REALIZADAS NOS CONSELHOS LOCAIS EM 2015"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE CONSELHEIROS DISTRITAIS QUALIFICADOS EM 2014"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE CONSELHEIROS DISTRITAIS EM 2014"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE CONSELHEIROS LOCAIS QUALIFICADOS EM 2014"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE CONSELHEIROS LOCAIS EM 2014"}
  ])
end

if HumanResourceFunction.count == 0
  HumanResourceFunction.create!([
    { name: "ADMINISTRADOR DE UNIDADE REMOTA" },
    { name: "AGENTE DE COMBATE A ENDEMIAS" },
    { name: "AGENTE INDÍGENA DE SANEAMENTO - AISAN" },
    { name: "AGENTE INDÍGENA DE SAÚDE - AIS" },
    { name: "ANTROPÓLOGO " },
    { name: "APOIADOR TÉCNICO EM ATENÇAO A SAUDE " },
    { name: "APOIADOR TÉCNICO EM SANEAMENTO  " },
    { name: "ARQUITETO E URBANISTA " },
    { name: "ASSESSOR INDÍGENA " },
    { name: "ASSISTENTE ADMINISTRATIVO " },
    { name: "ASSISTENTE SOCIAL " },
    { name: "AUXILIAR DE APOIO ADMINISTRATIVO  " },
    { name: "AUXILIAR DE FINANÇAS E ADMINISTRAÇÃO  " },
    { name: "AUXILIAR DE FINANÇAS E ADMINISTRAÇÃO  " },
    { name: "AUXILIAR DE MOBILIZAÇÃO POLITICA E SOCIAL " },
    { name: "AUXILIAR DE SAÚDE BUCAL " },
    { name: "AUXILIAR DE SERVIÇO DE APOIO  " },
    { name: "BIÓLOGO " },
    { name: "CIRURGIÃO DENTISTA  " },
    { name: "COORDENADOR ÁREA  " },
    { name: "COORDENADOR OPERACIONAL " },
    { name: "EDUCADOR EM SAÚDE " },
    { name: "ENFERMEIRO  " },
    { name: "ENGENHEIRO AMBIENTAL  " },
    { name: "ENGENHEIRO CIVIL  " },
    { name: "ENGENHEIRO ELÉTRICO " },
    { name: "ENGENHEIRO SANITARISTA  " },
    { name: "FARMACÊUTICO  " },
    { name: "FARMACÊUTICO/BIOQUIMICO " },
    { name: "FISIOTERAPEUTA  " },
    { name: "GEÓLOGO " },
    { name: "GERENTE FINANCEIRO ADMINISTRATIVO   " },
    { name: "MÉDICO  " },
    { name: "MICROSCOPISTA " },
    { name: "NUTRICIONISTA " },
    { name: "PEDAGOGO  " },
    { name: "PSICÓLOGO " },
    { name: "QUÍMICO " },
    { name: "  " },
    { name: "TÉCNICO DE ENFERMAGEM " },
    { name: "TÉCNICO DE FINANÇAS E ADMINISTRAÇÃO " },
    { name: "TÉCNICO DE LABORATÓRIO  " },
    { name: "TÉCNICO DE SEGURANÇA TRABALHO " },
    { name: "TÉCNICO DE QUÍMICA  " },
    { name: "TÉCNICO EDIFICAÇÕES " },
    { name: "TÉCNICO ELETROTÉCNICO " },
    { name: "TÉCNICO EM SAÚDE BUCAL  " },
    { name: "TÉCNICO EM SEGURANÇA DO TRABALHO  " },
    { name: "TÉCNICO FINANCEIRO ADMINISTRATIVO   " },
    { name: "TÉCNICO PRÓTESE DENTÁRIA  " },
    { name: "TÉCNICO SANEAMENTO  " },
    { name: "TERAPEUTA OCUPACIONAL " },
    { name: "CONTRATO TEMPORÁRIO DA UNIÃO - NÍVEL MÉDIO  " },
    { name: "CONTRATO TEMPORÁRIO DA UNIÃO - NÍVEL SUPERIOR " },
    { name: "ESTAGIÁRIO - NÍVEL MÉDIO  " },
    { name: "ESTAGIÁRIO - NÍVEL SUPERIOR " },
    { name: "MÉDICO - PMM  " },
    { name: "MÉDICO - PROVAB " },
    { name: "ADMINISTRADOR " },
    { name: "AGENTE ADMINISTRATIVO " },
    { name: "AGENTE AUXILIAR DE SAÚDE PÚBLICA  " },
    { name: "AGENTE DE ESTAÇÃO - ATIVO PERMANENTE - CEDIDO DO MT " },
    { name: "AGENTE DE PORTARIA  " },
    { name: "AGENTE DE SAÚDE PÚBLICA " },
    { name: "AGENTE DE SERVIÇOS COMPLEMENTARES " },
    { name: "AGENTE DE SERVIÇOS DE ENGENHARIA  " },
    { name: "AGENTE DE SERVICOS GERAIS " },
    { name: "AGENTE DE TRANSPORTE MARÍTIMO E FLUVIAL " },
    { name: "AGENTE DE VIGILÂNCIA  " },
    { name: "AJUDANTE DE TRANSPORTE MARÍTIMO E FLUVIAL " },
    { name: "ANALISTA TÉCNICO ADMINISTRATIVO " },
    { name: "ANALISTA TÉCNICO DE POLITICAS SOCIAIS " },
    { name: "ARTIFICE  " },
    { name: "ARTIFICE DE ARTES GRAFICAS  " },
    { name: "ARTIFICE DE ELETRICIDADE E COMUNICAÇÕES " },
    { name: "ARTIFICE DE MANUTENÇÃO DE VEÍCULOS  " },
    { name: "ARTIFICE DE MECÂNICA  " },
    { name: "ARTIFICE ESPECIALIZADO  " },
    { name: "ASSISTENTE ADMINISTRATIVO " },
    { name: "ASSISTENTE DA PRESIDÊNCIA - CEDIDO  " },
    { name: "ASSISTENTE DE ADMINISTRAÇÃO " },
    { name: "ATENDENTE DE ENFERMAGEM " },
    { name: "AUXILIAR  ADMINISTRATIVO  " },
    { name: "AUXILIAR DE  SERVIÇOS GERAIS  " },
    { name: "AUXILIAR DE  SERVIÇOS GERAIS HOSPITALARES " },
    { name: "AUXILIAR DE ADMINISTRAÇÃO " },
    { name: "AUXILIAR DE ARTIFICE  " },
    { name: "AUXILIAR DE CONTABILIDADE " },
    { name: "AUXILIAR DE ENFERMAGEM  " },
    { name: "AUXILIAR DE ENSINO  " },
    { name: "AUXILIAR DE ESTATISTICA " },
    { name: "AUXILIAR DE HIGIENE DENTAL  " },
    { name: "AUXILIAR DE LABORATÓRIO   " },
    { name: "AUXILIAR DE PRODUÇÃO  " },
    { name: "AUXILIAR DE SANEAMENTO  " },
    { name: "AUXILIAR DE SAÚDE PÚBLICA " },
    { name: "AUXILIAR DE SERVIÇOS DIVERSOS " },
    { name: "AUXILIAR DE SERVIÇOS GERAIS " },
    { name: "AUXILIAR DE TRANSPORTE MARÍTIMO E FLUVIAL " },
    { name: "AUXILIAR OPERACIONAL SERVIÇOS DIVERSOS  " },
    { name: "AUXILIAR RURAL  " },
    { name: "AUXILIAR TÉCNICO DA PRODUÇÃO A  " },
    { name: "AUXILIAR TÉCNICO DA PRODUÇÃO B  " },
    { name: "AUXILIAR TÉCNICO DE PESQUISA  " },
    { name: "BIOMÉDICO " },
    { name: "BIOQUÍMICO  " },
    { name: "CARTÓGRAFO  " },
    { name: "CONDUTOR DE LANCHA  " },
    { name: "CONTRAMESTRE  " },
    { name: "DATILOGRAFO " },
    { name: "DESENHISTA  " },
    { name: "DIGITADOR   " },
    { name: "DIVULGADOR SANITÁRIO  " },
    { name: "ECONOMISTA  " },
    { name: "ECONOMO " },
    { name: "ENGENHEIRO AGRONOMO " },
    { name: "ESTATÍSTICO " },
    { name: "GUARDA DE ENDEMIAS  " },
    { name: "INSPETOR DE SANEAMENTO  " },
    { name: "LABORATORISTA " },
    { name: "MECÂNICO  " },
    { name: "MEDIADORA DO CONTROLE SOCIAL - CEDIDA SEE ACRE  " },
    { name: "MÉDICO VETERINARIO  " },
    { name: "MESTRE  " },
    { name: "MESTRE DE LANCHA  " },
    { name: "MICROSCOPISTA " },
    { name: "MONITOR DE SAUDE  " },
    { name: "MOTORISTA OFICIAL " },
    { name: "OPERADOR DE COMPUTADOR  " },
    { name: "PESQUISADOR EM CIÊNCIAS DA SAÚDE  " },
    { name: "PROFESSOR DE 1 GRAU " },
    { name: "SANITARISTA " },
    { name: "TÉCNICO AMBIENTAL " },
    { name: "TÉCNICO DE CONTABILIDADE  " },
    { name: "TÉCNICO EM ASSUNTOS EDUCACIONAIS  " },
    { name: "TÉCNICO EM CARTOGRAFIA  " },
    { name: "TÉCNICO EM COMUNICAÇÃO SOCIAL " },
    { name: "TÉCNICO EM RADIOLOGIA   " },
    { name: "TÉCNICO EM SAÚDE  " },
    { name: "TÉCNICO MICROGRAFICO  " },
    { name: "TÉCNICO QUÍMICO " },
    { name: "TELEFONISTA " },
    { name: "TOPÓGRAFO " },
    { name: "VIGIA " },
    { name: "VISITADOR SANITÁRIO " },
    { name: "AGENTE DE LIMPEZA " },
    { name: "AJUDANTE GERAL  " },
    { name: "ALMOXARIFE  " },
    { name: "APOIO LOGÍSTICO   " },
    { name: "ARRUMADEIRA " },
    { name: "ASSISTENTE TÉCNICO  " },
    { name: "ATENDENTE " },
    { name: "AUXILIAR DE ALMOXARIFADO  " },
    { name: "AUXILIAR DE ALMOXARIFE  " },
    { name: "AUXILIAR DE COORDENADORA ESTADUAL   " },
    { name: "AUXILIAR DE COZINHA " },
    { name: "AUXILIAR DE LAVADEIRA " },
    { name: "AUXILIAR DE LAVANDERIA HOSPITALAR " },
    { name: "AUXILIAR DE LIMPEZA   " },
    { name: "AUXILIAR DE MANUTENÇÃO  " },
    { name: "BARQUEIRO " },
    { name: "BOMBEIRO CIVIL  " },
    { name: "BOMBEIRO HIDRAULICO " },
    { name: "BRIGADISTA  " },
    { name: "CAPINEIRO " },
    { name: "CARREGADOR DE BENS  " },
    { name: "CARREGADOR E DESCARREGADOR  " },
    { name: "CONDUTOR DE BARCO " },
    { name: "CONDUTOR FLUVIAL  " },
    { name: "COORDENADOR OPERACIONAL " },
    { name: "COPEIRO " },
    { name: "COZINHEIRO  " },
    { name: "ELETRICISTA   " },
    { name: "ENCANADOR   " },
    { name: "ENCARREGADO " },
    { name: "LAVADEIRA " },
    { name: "LIDER DE EQUIPE   " },
    { name: "MARINHEIRO FLUVIAL DE CONVÉS  " },
    { name: "MOÇO DE CONVÉS  " },
    { name: "MOTORISTA   " },
    { name: "MOTORISTA FLUVIAL " },
    { name: "OFFICE BOY  " },
    { name: "OFICIAL ADMINISTRATIVO  " },
    { name: "OFICIAL DE SERVIÇOS GERAIS  " },
    { name: "PILOTO DE BARCO " },
    { name: "PILOTO DE EMBARCAÇÃO  " },
    { name: "PILOTO DE LANCHA  " },
    { name: "PILOTO FLUVIAL  " },
    { name: "PORTEIRO  " },
    { name: "RECEPCIONISTA " },
    { name: "SECRETÁRIA  " },
    { name: "SEGURANÇA " },
    { name: "SERVENTE DE LIMPEZA " },
    { name: "SERVIÇOS GERAIS " },
    { name: "SUPERVISOR  " },
    { name: "TÉCNICO DE INFORMÁTICA/SISTEMAS " },
    { name: "TÉCNICO DE MANUTENÇÃO " },
    { name: "TÉCNICO DE SECRETARIADO   " },
    { name: "TÉCNICO DE SUPORTE DOCUMENTAL II  " },
    { name: "TÉCNICO DE SUPORTE II " },
    { name: "VIGILÂNCIA ARMADA   " },
    { name: "VIGILÂNCIA DESARMADA  " },
    { name: "VIGILANTE " },
    { name: "ZELADOR " }
  ])
end

if DestinationType.count == 0
  DestinationType.create!([
    { name: 'UBSI' },
    { name: 'Polo Base' },
    { name: 'CASAI' },
    { name: 'Média e Alta Complexidade' }
  ])
end

if ResultLevel.count == 0
  ResultLevel.create!([
    { name: 'Nacional' },
    { name: 'DSEI' },
  ])
end

if ResultAxis.count == 0
  ResultAxis.create!([
    { name: 'ATENÇÃO À SAÚDE' },
    { name: 'SANEAMENTO AMBIENTAL' },
    { name: 'LOGÍSTICA E INFRAESTRUTURA' },
    { name: 'MODELO DE GESTÃO' },
    { name: 'PLANEJAMENTO E GESTÃO DA INFORMAÇÃO' },
    { name: 'QUALIFICAÇÃO DO GASTO PÚBLICO' },
    { name: 'COMUNICAÇÃO' },
    { name: 'ARTICULAÇÃO INTERFEDERATIVA' },
    { name: 'CONTROLE SOCIAL' },
  ])
end

if ResultStrategy.count == 0
  ResultStrategy.create!([
    { name: 'Qualificação das Ações e Equipes de Saúde indígena that atuam nsa DSEI/SESAI', result_axis_id: 1 },
    { name: 'Qualificação de serviços de saneamento ambiental ofertados', result_axis_id: 2 },
    { name: 'Provimento de infraestrutura, equipamentos, insumos e logística adequados à execução das ações de saúde indígena pelos DSEIs', result_axis_id: 3 },
    { name: 'Aprimoramento do modelo de gestão do Subsistema de Atenção à Saúde Indígena do SUS', result_axis_id: 4 },
    { name: 'Estruturação e fortalecimento da cultura de planejamento e gestão da informação', result_axis_id: 5 },
    { name: 'Ampliação da qualificação do gasto público com ganhos de eficiência do uso de recursos e efetividade das ações em saúde', result_axis_id: 6 },
    { name: 'Reestruturação do modelo de comunicação e ampliação da sua capacidade produtiva, respeitando as especificidades dos povos indígenas', result_axis_id: 7 },
    { name: 'Ampliação das articulações interfederativa e intersetoriais com vistas à integralidade das ações de atenção a saúde indígena', result_axis_id: 8 },
    { name: 'Ampliação da efetividade do controle social em acompanhar e fiscalizar a PNASPI', result_axis_id: 9 },
  ])
end

if Result.count == 0
  Result.create!([
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '85% das crianças menores de 5 anos com acompanhamento alimentar e nutricional realizado  ', value_2016:  70  , value_2017: 75  , value_2018: 80  , value_2019: 85  , result_text: '  [VALUE]% das crianças menores de 5 anos com acompanhamento alimentar e nutricional realizado  ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '90% de gestantes com acompanhamento alimentar e nutricional realizado  ', value_2016:  70  , value_2017: 75  , value_2018: 80  , value_2019: 90  , result_text: '  [VALUE]% gestantes com acompanhamento alimentar e nutricional realizado ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  false , name: 'Plano de contingência de DDA e IRA implementado em 34 DSEI.  ', value_2016:  10  , value_2017: 20  , value_2018: 34  , value_2019: 34  , result_text: '  [VALUE] DSEI contam com plano de contigência de DDA e IRA implementado  ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: 'Acesso ao pré-natal, parto e puerpério qualificado e ampliado para 90% das gestantes com 4 consultas ou mais ', value_2016:  60  , value_2017: 70  , value_2018: 80  , value_2019: 90  , result_text: '  Acesso ao pré-natal, parto e puerpério qualificado e ampliado para [VALUE]% gestantes com 4 consultas ou mais ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '90% dos óbitos materno, infantil, fetal e de mulheres em idade fértil investigados  ', value_2016:  80  , value_2017: 83  , value_2018: 86  , value_2019: 90  , result_text: '  [VALUE]% dos óbitos materno, infantil e fetal, mulheres em idade fértil investigados.   ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '85% das crianças menores de 5 anos com esquema vacinal completo, de acordo com o calendário indígena de vacinação. ', value_2016:  77  , value_2017: 79.5  , value_2018: 82  , value_2019: 85  , result_text: '  [VALUE]% as crianças menores de 5 anos com esquema vacinal completo, de acordo com o calendário indígena de vacinação.  ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: 'Reduzir em 10% os casos de suicídio nos 34 DSEIs ', value_2016:  2 , value_2017: 4 , value_2018: 7 , value_2019: 10  , result_text: '  reduzir em [VALUE]% os casos de suicídio nos 34 DSEIs tendo como linha de base os números de 2015 ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '60% de cobertura da população indígena com primeira consulta odontológica programática realizada.  ', value_2016:  40  , value_2017: 50  , value_2018: 55  , value_2019: 60  , result_text: '  [VALUE]% de cobertura da população indígena com primeira consulta odontológica programática ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: 'Incidência parasitária anual de malária reduzida para menos do que 10 por mil habitantes ', value_2016:  20  , value_2017: 20  , value_2018: 20  , value_2019: 20  , result_text: '  Reduzir a IPA 2018 em [VALUE]%  ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: 'Coeficiente de incidência de tuberculose na população indígena reduzido em 20% (linha de base em 2014 : 56,19/100.000 casos)  ', value_2016:  3 , value_2017: 5 , value_2018: 5 , value_2019: 7 , result_text: '  Reduzir [VALUE]% do coeficiente de incidência de tuberculose na população indígena  ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '100% dos trabalhadores da saúde indigena qualificados para o trabalho em contextos interculturais ', value_2016:  25  , value_2017: 50  , value_2018: 75  , value_2019: 100 , result_text: '  [VALUE]% dos trabaljhadores da saúde indigena qualificados para o trabalho em saúde nos contextos interculturais  ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 1 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'Projetos para atuação em contextos interculturais implementados nos 34 DSEIS, com protagonismo indígena na promoção, prevenção e cuidado em saúde e valorização de práticas tradicionais  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  Projetos para atuação em contextos interculturais implementados nos 34 DSEIS, com protagonismo indígena na promoção, prevenção e cuidado em saúde e valorização de práticas tradicionais  ', orientacoes_dsei: '  - ', orientacoes_sistema: '   '},

    { result_strategy_id: 2 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '70% das aldeias com população superior a 50 habitantes contam com Sistemas de Abastacemiento de Água em funcionamento (base 2015: 58%)  ', value_2016:  61  , value_2017: 63  , value_2018: 67  , value_2019: 70  , result_text: '  [VALUE]% das aldeias com população superior a 50 habitantes contam com Sistemas de Abastacemiento de Água em funcionamento  ', orientacoes_dsei: '  out/2015 = 2821 aldeias com mais de 50 hab. Aldeias com água = 1642 ( 58,21%) . Fonte: "dados aldeias" jul/2015. Partir de 1.642 para 1.962 no final. Serão construídos, como produtos no plano, 2016 = 80, 2017 = 80, 2018 = 80 e 2019 = 80  ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 2 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '40% ou mais das aldeias com população inferior a 50 habitantes contam com Sistemas de Abastacemiento de Água em funcionamento (base 2015: 33%)  ', value_2016:  37  , value_2017: 38  , value_2018: 39  , value_2019: 40  , result_text: '  [VALUE]% ou mais das aldeias com população inferior a 50 habitantes contam com Sistemas de Abastacemiento de Água em funcionamento  ', orientacoes_dsei: '  out/2015 = 2142 aldeias com menos de 50 hab. Aldeias com água = 710 = 33,15%  fonte: "dados aldeias jul 2015". Partir de710 para 850 no final. Serão implantados 2016 = 35, 2017 = 35, 2018 = 35, 2019 = 30.  ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima. Prever possibilidade de o DSEI desagregar o resultado por SAA a ser implantado ou reformado (vinculado ao território)  '},
    { result_strategy_id: 2 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '70% ou mais das aldeias contam com destinação adequada de dejetos (base 2015: 50%)  ', value_2016:  55  , value_2017: 60  , value_2018: 65  , value_2019: 70  , result_text: '  [VALUE]% ou mais das aldeias contam com destinação adequada de dejetos  ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima. Prever possibilidade de o DSEI desagregar o resultado por SAA a ser implantado ou reformado (vinculado ao território)  '},
    { result_strategy_id: 2 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: 'Qualidade da água monitorada em 80% das aldeias com SAA implementado  ', value_2016:  55  , value_2017: 60  , value_2018: 70  , value_2019: 80  , result_text: '  Qualidade da água monitorada em [VALUE]% das aldeias com SAA implementado ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima.  '},
    { result_strategy_id: 2 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '70% ou mais de aldeias contam com destino adequado de resíduos sólidos  ', value_2016:  40  , value_2017: 50  , value_2018: 60  , value_2019: 70  , result_text: '  [VALUE]% ou mais de aldeias contam com destino adequado de resíduos sólidos ', orientacoes_dsei: '    ', orientacoes_sistema: ' Texto dos resultados dos DSEIs será igual à referência nacional. Edição do percentual só poderá ser feita para cima. Prever possibilidade de o DSEI desagregar o resultado por SAA a ser implantado ou reformado (vinculado ao território)  '},

    { result_strategy_id: 3 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  false , name: 'Reformar/ampliar 26 Casas de Saúde Indígena (CASAI).  ', value_2016:  3 , value_2017: 10  , value_2018: 10  , value_2019: 3 , result_text: '  [VALUE] CASAIS construídas ou reformadas  ', orientacoes_dsei: '    ', orientacoes_sistema: ' DSEI poderá colocar qualquer número inteiro '},
    { result_strategy_id: 3 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  false , name: '34 DSEIs contam com Rede de lógica e internet funcionando adequadamente.  ', value_2016:  4 , value_2017: 10  , value_2018: 10  , value_2019: 10  , result_text: '  [VALUE] DSEIs contam com Rede de lógica e internet funcionando adequadamente. ', orientacoes_dsei: '    ', orientacoes_sistema: ' DSEI tem liberdade para propor produtos '},
    { result_strategy_id: 3 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'Equipes dos DSEI providas com os insumos necessários para executar suas ações.  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  Equipes dos DSEI providas com os insumos necessários para executar suas ações.  ', orientacoes_dsei: '    ', orientacoes_sistema: ' DSEI tem liberdade para propor produtos '},
    { result_strategy_id: 3 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'Equipes do DSEI/SESAI equipadas para execução das ações.  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  Equipes do DSEI/SESAI equipadas para execução das ações.  ', orientacoes_dsei: '    ', orientacoes_sistema: ' DSEI tem liberdade para propor produtos '},
    { result_strategy_id: 3 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'Os 34 DSEIs contam com logística adequada para execução das ações.  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  Os 34 DSEIs contam com logística adequada para execução das ações.  ', orientacoes_dsei: '    ', orientacoes_sistema: ' NÃO ENTRA NO PDSI '},
    { result_strategy_id: 3 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  false , name: 'UBSIs construídas ou reformadas, com plena condição de oferta de serviços para a população indígena ', value_2016:  100 , value_2017: 50  , value_2018: 50  , value_2019: 50  , result_text: '  [VALUE] UBSIs construídas ou reformadas, com plena condição de oferta de serviços para a população indígena ', orientacoes_dsei: '  Reformas e construções devem ser produtos separados ', orientacoes_sistema: ' DSEI poderá colocar qualquer número inteiro, incluindo reformas e construções '},
    { result_strategy_id: 3 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  false , name: 'Pólos base construídos e em plena condição de apoiar a oferta de serviços para a população indígena ', value_2016:  8 , value_2017: 10  , value_2018: 10  , value_2019: 10  , result_text: '  [VALUE] Pólos base construídos e em plena condição de apoiar a oferta de serviços para a população indígena  ', orientacoes_dsei: '  Reformas e construções devem ser produtos separados ', orientacoes_sistema: ' DSEI poderá colocar qualquer número inteiro, incluindo reformas e construções '},

    { result_strategy_id: 4 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'Competências da SESAI revisadas e implementadas.  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  Competências da SESAI revisadas e implementadas.  ', orientacoes_dsei: '    ', orientacoes_sistema: ' NÃO ENTRA NO PDSI '},

    { result_strategy_id: 5 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: '100% dos DSEIs contam com o SIASI implementado  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  [VALUE]% dos DSEIs contm com o SIASI implementado ', orientacoes_dsei: '    ', orientacoes_sistema: ' DSEI tem liberdade para propor produtos '},
    { result_strategy_id: 5 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  true  , name: '33% do GEOSI desenvolvido com painel de controle funcionando.   ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  33% do GEOSI desenvolvido com painel de controle funcionando.   ', orientacoes_dsei: '    ', orientacoes_sistema: ' NÃO ENTRA NO PDSI '},
    { result_strategy_id: 5 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: '100% dos DSEIs contam com sistema Hórus implementado nas sedes, pólos base e CASAI  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  [VALUE]% dos DSEIs contam com sistema Hórus implementado nas sedes, pólos base e CASAI  ', orientacoes_dsei: '    ', orientacoes_sistema: ' DSEI tem liberdade para propor produtos '},
    { result_strategy_id: 5 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'Ações estratégicas do plano estratégicos do PDSI da SESAI central e dos DSEI monitorados. ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  Ações estratégicas do plano estratégicos do PDSI da SESAI central e dos DSEI monitorados. ', orientacoes_dsei: '    ', orientacoes_sistema: ' NÃO ENTRA NO PDSI '},

    { result_strategy_id: 6 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'Qualificação do gasto público com ganho de eficiência do uso de recurso e efetividade das ações em saúde. ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  30. Qualificação do gasto público com ganho de eficiência do uso de recurso e efetividade das ações em saúde. ', orientacoes_dsei: '    ', orientacoes_sistema: ' NÃO ENTRA NO PDSI '},
    { result_strategy_id: 6 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'SESAI conseguir obter melhor relação no custo x efetividade das ações de saúde. ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  SESAI conseguir obter melhor relação no custo x efetividade das ações de saúde. ', orientacoes_dsei: '    ', orientacoes_sistema: ' NÃO ENTRA NO PDSI '},

    { result_strategy_id: 7 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'Imagem institucional da SESAI fortalecida.  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  Imagem institucional da SESAI fortalecida.  ', orientacoes_dsei: '    ', orientacoes_sistema: ' NÃO ENTRA NO PDSI '},

    { result_strategy_id: 8 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: '6ª CNSI realizada ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  6ª CNSI realizada ', orientacoes_dsei: '    ', orientacoes_sistema: ' Permite produtos apenas em 2017, relacionados às conferências distritais  '},
    { result_strategy_id: 8 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'Instâncias de controle social fortalecidas  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  Instâncias de controle social fortalecidas  ', orientacoes_dsei: '    ', orientacoes_sistema: ' DSEI tem liberdade para propor produtos '},

    { result_strategy_id: 9 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: 'Articulação intersetorial efetiva para melhoria dos determinantes sociais da saúde indígena.  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  Articulação intersetorial efetiva para melhoria dos determinantes sociais da saúde indígena.  ', orientacoes_dsei: '    ', orientacoes_sistema: ' DSEI tem liberdade para propor produtos '},
    { result_strategy_id: 9 , result_level_id:  1 , is_boolean: true  , is_specific:  false , is_percentage:  false , name: '100% dos DSEIs inseridos no processo de regulação estadual, regional e municipal  ', value_2016:  0 , value_2017: 0 , value_2018: 0 , value_2019: 0 , result_text: '  100% dos DSEIs inseridos no processo de regulação estadual, regional e municipal  ', orientacoes_dsei: '    ', orientacoes_sistema: ' DSEI tem liberdade para propor produtos '},
    { result_strategy_id: 9 , result_level_id:  1 , is_boolean: false , is_specific:  false , is_percentage:  false , name: '31 CASAI inseridas no fluxo de regulação de estados e municipios, alcançando 100% das CASAI ', value_2016:  6 , value_2017: 10  , value_2018: 10  , value_2019: 11  , result_text: '  [VALUE]% CASAIs inseridas no fluxo de regulação de estados e municipios alcançando 100% das CASAI ', orientacoes_dsei: '    ', orientacoes_sistema: ' DSEI tem liberdade para propor produtos' }

  ])
end

if ProjectionBudgetCategory.count == 0
  ProjectionBudgetCategory.create!([
    { name: 'Obras de Edificações' },
    { name: 'Obras de Saneamento' },
    { name: 'Equipamentos' },
  ])
end

if ProjectionBudgetItem.count == 0
  ProjectionBudgetItem.create!([
    { projection_budget_category_id: 1, name: 'CASAI' },
    { projection_budget_category_id: 1, name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo I' },
    { projection_budget_category_id: 1, name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo II' },
    { projection_budget_category_id: 1, name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo III' },
    { projection_budget_category_id: 1, name: 'SEDE DO NÚCLEO DISTRITAL DA SESAI' },
    { projection_budget_category_id: 1, name: 'PÓLO-BASE' },
    { projection_budget_category_id: 1, name: 'REFORMAS' },

    { projection_budget_category_id: 2, name: 'SISTEMA DE ABASTECIMENTO DE ÁGUA (SAA)' },
    { projection_budget_category_id: 2, name: 'MELHORIAS SANITÁRIAS DOMICILIARES (MSD)' },
    { projection_budget_category_id: 2, name: 'ESGOTAMENTO SANITÁRIO' },

    { projection_budget_category_id: 3, name: 'VEÍCULOS' },
    { projection_budget_category_id: 3, name: 'BARCOS' },
    { projection_budget_category_id: 3, name: 'MOTORES DE BARCO' },
    { projection_budget_category_id: 3, name: 'GERADORES' },
    { projection_budget_category_id: 3, name: 'EQUIPAMENTOS MÉDICO-HOSPITALARES (EMH)' },
    { projection_budget_category_id: 3, name: 'EQUIPAMENTOS DE SANEAMENTO' },
    { projection_budget_category_id: 3, name: 'MOBILIÁRIO' },
  ])
end

if TextTemplate.count == 0
  TextTemplate.create!([
    { introducao_1: '<p><strong>1.1 Apresentação&nbsp;</strong></p><p>A SESAI é a área do Ministério da Saúde criada em 2010 para  coordenar e executar o processo de gestão do Subsistema de Atenção à Saúde  Indígena em todo Território Nacional. Sua missão é promover a atenção à saúde  aos povos indígenas, aprimorando as ações de atenção básica e de saneamento  básico nas aldeias, observando as práticas de saúde e os saberes tradicionais,  articulando com os demais gestores do SUS para prover ações complementares e  especializadas, com controle social. </p><p>A criação da Secretaria Especial de Saúde Indígena (SESAI),  no final de 2010, representou um grande avanço na atenção à saúde indígena e  traz grandes desafios de gestão para o Ministério da Saúde. É uma Secretaria  que, diferentemente das demais Secretarias do Ministério da Saúde, executa  diretamente os serviços de atenção e prevenção à saúde, atuando nacionalmente  através de equipamentos e pessoal próprios.</p><p>Para implementar o Subsistema de Atenção à Saúde Indígena e executar  suas ações, a estrutura administrativa da SESAI conta com 3 departamentos<!--[if !supportFootnotes]-->[1] no  âmbito central e 34 Distritos Sanitários Especiais Indígenas (DSEIs), que são  as unidades gestoras descentralizadas do Subsistema, responsáveis pela execução  de ações de atenção à saúde nas aldeias, saneamento ambiental e edificações de  saúde indígena.</p><p>Os Planos Distritais de Saúde Indígena (PDSI) permitem o  planejamento da oferta de serviços de atenção à Saúde Indígena atendendo às  especificidades de cada um dos Distrito Especiais de Saúde Indígena. É um  instrumento que visa aprimorar o planejamento da gestão, buscando maior  eficiência e eficácia de suas ações.&nbsp; Os  PDSI possibilitam a integração dos planejamentos de cada Distrito ao Plano  Nacional de Saúde/ Plano Plurianual 2015-2019 e o Planejamento Estratégico da  Secretaria Especial de Saúde Indígena. </p><p>Para efetivar as ações do Subsistema de Atenção à Saúde  Indígena, de forma democrática e participativa, o Plano Distrital de Saúde  Indígena 2016-2019, previsto  na Lei nº 8.080/90, no Decreto nº 3.156/99 e na Portaria nº 3.965/2010, foi  elaborado durante o ano de 2015. &nbsp;O  presente documento além de consolidar o processo e os resultados do Plano  Distrital de Saúde Indígena de <strong>[NOME_DSEI]</strong> para o período 2016-2019,  busca dar visibilidade e transparência para a gestão da saúde indígena,  subsidiando assim o exercício de um controle social efetivo sobre a atuação do  governo. </p><p>Nessa introdução, além da apresentação, registram-se os  propósitos e princípios dos PDSI. As etapas e atividades que conformaram o  processo de construção dos PDSI são detalhadas no item 2. </p><p>Fundamental para todo exercício de planejamento é a  construção de um bom diagnóstico sobre a situação atual e a reflexão sobre os  aprendizados de exercícios de planejamento anteriores. </p><p>Nesse sentido, o item 3 do presente documento traz a  caracterização do DSEI - contemplando informações acerca das respectivas  condições socioeconômicas, epidemiológicas e de gestão do sistema. </p><p>O item 4, por sua vez, registra a análise situacional do  DSEI, construída junto ao Controle Social, com a avaliação da implementação do  PDSI referente ao período entre 2012-2015, os indicadores de saúde do Distrito  e a análise sobre os principais desafios do distrito.</p><p>Os resultados esperados para o período 2016-2019  encontram-se registrados no item 5. Complementarmente, o item 6 traz a projeção  &nbsp;orçamentária para o período.</p><p><strong>1.2 Propósitos e Princípios do PDSI</strong></p><p>Por sua importância como instrumento de planejamento, os  Planos Distritais de Saúde Indígena respondem a diversos propósitos, tanto para  a gestão dos Distritos Especiais de Saúde Indígena, como para a gestão da SESAI  Central e para o Controle Social. </p><p>No âmbito dos Distritos Especiais de Saúde Indígena, o PDSI deve  apoiar todo o ciclo do planejamento para a oferta de serviços de saúde no  âmbito distrital, a saber: (i) o diagnóstico das necessidades de saúde do  território; (ii) Apontar os resultados esperados, metas e indicadores, assim  como a projeção do orçamento quadrienal (iii)&nbsp;  definição de prioridades estratégicas para o plano de ação anual,  orientação para a execução das macro-ações (iv) Permitir o monitoramento das  ações, subsidiar a prestação de contas e a aferição de resultados. </p><p>No âmbito da SESAI Central, os PDSI devem permitir um  efetivo conhecimento das necessidades dos DSEIs contribuindo para subsidiar a  definição de prioridades estratégicas para SESAI e garantir o alinhamento entre  os instrumentos de planejamento e gestão (Plano Plurianual, Plano Estratégico  SESAI e PDSIs). Além disso, os PDSI são ferramenta essencial para que a SESAI  central cumpra seu papel no fomento da execução e monitoramento das ações,  assim como acompanhamento da execução orçamentária, base para alimentação do  Relatório Anual de Gestão (RAG).</p><p>Finalmente, no âmbito do Controle Social, na figura dos  Conselhos Distritais de Saúde Indígena, o PDSI permite o acompanhamento e  fiscalização das ações aprovadas, assim como a avaliação do impacto das mesmas sobre  a saúde dos povos indígenas. </p><p>Para  cumprir com esses propósitos, a elaboração dos Planos Distritais de Saúde  Indígena 2016-2019 deve prezar pela clareza de seus conteúdos e garantir ao alinhamento  com os demais instrumentos de planejamento do Governo Federal, assim como a  viabilidade dos resultados previstos. Além disso, devem ser construídos através  do diálogo e consulta com as populações indígenas. Esses princípios  encontram-se registrados e detalhados na figura 1.</p><p><img alt="Figura 1. Princípios para a Formulação do Plano Distrital de Saúde Indígena" class="fr-fin fr-dib" src="/images/Figura1.png" title="Figura 1. Princípios para a Formulação do Plano Distrital de Saúde Indígena" width="671"></p><p>[1]  Departamento de Gestão  da Saúde Indígena (DGESI), Departamento de Atenção à Saúde Indígena  (DASI),&nbsp; Departamento de Saneamento e  Edificações de Saúde (DSESI)</p><p><br></p><p><br></p>', created_at: '2015-10-29 22:54:13.605808', updated_at: '2015-10-30 15:42:12.899835', processo_construcao_pdsi_2: '<p>O processo de construção dos PDSI 2016-2019 foi estruturado  em três etapas: a primeira dedicou-se a atividades preparatórias de formulação  técnica e política do processo, a segunda se constituiu como o momento para a  análise situacional dos Distritos de Saúde Indígena que subsidiou a terceira  etapa, dedicada à elaboração de resultados e planejamento orçamentário, assim  como aprovação dos Planos Distritais de Saúde Indígena. Nas três etapas, o  processo previu momentos de consulta ao controle social, assim como espaço para  devolutivas do governo sobre os resultados da consulta. Nos próximos itens são  detalhados os objetivos e atividades de cada uma das etapas.</p><p>A figura 2, ao final dessa seção registra graficamente as  principais etapas do processo</p><p><br></p><p><strong>Etapa 1. Elaboração da  metodologia de construção do Plano Distrital de Saúde Indígena 2016-2019</strong></p><hr class="fr-tag"><p style="border:none;mso-border-top-alt:solid #31849B .5pt;  mso-border-top-themecolor:accent5;mso-border-top-themeshade:191;mso-border-bottom-alt:  solid #31849B .5pt;mso-border-bottom-themecolor:accent5;mso-border-bottom-themeshade:  191;padding:0cm;mso-padding-alt:1.0pt 0cm 1.0pt 0cm">O principal objetivo dessa  etapa foi promover um processo de reflexão técnica e concertação política sobre  propósitos e formatos para a elaboração dos Planos Distritais de Saúde Indígena  2016-2019.</p><hr class="fr-tag"><p>O processo de construção do PDSI 2016-2019 teve início em  junho de 2015, com a elaboração de uma proposta de metodologia por parte do  Grupo de Trabalho do PDSI (GT-PDSI), composto por todas as áreas da SESAI  Central, cinco coordenadores de DSEI e&nbsp;  um presidente de CONDISI. O GT-PDSI foi criado em maio de 2015, durante  a Oficina de Planejamento Estratégico da Saúde Indígena, que contou com a  presença de todos os coordenadores de DSEI e presidentes de CONDISI. </p><p>O GT-PDSI reuniu-se diversas vezes, totalizando quatro dias  de reuniões, para (i) avaliar avanços e dificuldades do processo de elaboração  do PDSI anterior; (ii) definir os propósitos do PDSI 2016-2019; (iii) definir  os princípios norteadores do processo de construção do PDSI 2016-2019; (iv) &nbsp;definir conteúdo e metodologia processo de  construção do PDSI 2016-2019. Durante essa primeira fase foram definidos, também, os tetos  orçamentários anualizados por DSEI.</p><p>No mês de julho de 2015, a proposta da metodologia foi  apresentada em oficina com coordenadores do DSEI, que tiveram a oportunidade de  sugerir as adaptações necessárias na proposta para que esta respondesse a  necessidade e possibilidades de todos os DSEI.&nbsp;  Entre julho e agosto de 2015 o processo de construção do PDSI 2016-2019  foi apresentado para os Conselhos Distritais de Saúde Indígena.</p><p>Ainda, em agosto de 2015 uma oficina om a participação das  equipes dos DSEI e presidentes do CONIDISI serviu como momento de formação  sobre o processo de elaboração do PDSI, incluindo não só a metodologia de construção,  mas também formação sobre critérios para a definição de tetos orçamentários e  competências da SESAI. Após essa oficina, os presidentes de CONDISI realizaram  devolutiva no âmbito de seus distritos sobre as questões trabalhadas na oficina  de formação.</p><p><br></p><p><strong>Etapa 2: Análise  Situacional dos Distritos Sanitários Especiais Indígenas</strong></p><hr class="fr-tag"><p>O principal objetivo dessa  etapa foi construir um diagnóstico compartilhado de cada território</p><hr class="fr-tag"><p>O diagnóstico consolidado de cada território se alimentou de  diversas fontes: (i) avaliação do PDSI 2012-2015; (ii) Caracterização do DSEI;  (iii) oficinas consultivas com CONDISI e Conselhos Locais para complementações  e levantamento e priorização de necessidades do território.</p><p>Para cumprir com esse objetivo, o primeiro passo foi a realização  da avaliação do PDSI 2012-2015, tanto quantitativo (comparativo entre as metas  planejadas e metas efetivamente alcançadas) como qualitativo (aprendizagens e  desafios do período). Essa avaliação for realizada primeiramente, em julho de  2015, pelas equipes dos DSEIs que se encarregaram de consolidar informações.  Nos meses de julho e agosto, essa avaliação foi compartilhada e complementada  pelos Presidente de CONDISI. &nbsp;As equipes  do DSEI e Pólos Bases se encarregaram também, entre agosto e setembro, de  levantar informações para a caracterização do DSEI, incluindo dados  demográficos, fisiográficos e do mapa de indicadores estratégicos, que servem como linha de base  para o planejamento.</p><p>A avaliação quantitativa e qualitativa do PDSI, assim como  os dados de caracterização do DSEI foram compartilhados em reuniões com os  Conselhos Locais, realizadas entre setembro e outubro. Durante essas oficinas  identificaram-se também os principais desafios e prioridades de cada  território.</p><p class="paragrafo_dsei">[PARAGRAFO_DSEI]</p><p>Os resultados dessa etapa de Análise Situacional  encontram-se registrados nos itens 3 e 4 desse documento. O item 3 traz a  caracterização do território. O item 4.1 registra a avaliação qualitativa do  PDSI 2012-2015, o item 4.2 traz os indicadores do território e o item 4.3 traz  os principais desafios do território. No anexo 1 encontram-se os resultados da  avaliação quantitativa e comparativa entre planejado e realizado no período  2012-2015.</p><p><br></p><p><strong>Etapa 3: Definição dos  Resultados Esperados e do Orçamento Macro para 2016, 2017, 2018 e 2019</strong></p><hr><p style="border:none;mso-border-top-alt:solid #31849B .5pt;  mso-border-top-themecolor:accent5;mso-border-top-themeshade:191;mso-border-bottom-alt:  solid #31849B .5pt;mso-border-bottom-themecolor:accent5;mso-border-bottom-themeshade:  191;padding:0cm;mso-padding-alt:1.0pt 0cm 1.0pt 0cm">Essa etapa buscou consolidar  todos os desafios e prioridades levantados na segunda etapa e endereçá-los  através do planejamento de resultados para o PDSI 2016-2019</p><hr class="fr-tag"><p>Em outubro, foi elaborada a primeira versão dos Resultados  Esperados e o Orçamento Macro para o período de 2016-2019 pelas equipes dos  DSEIS, com base nos insumos elaborados durante a etapa anterior e tendo como  orientador o Plano Estratégico da SESAI (ver item X). &nbsp;Essa primeira versão dos Resultados foi  enviada às áreas centrais da SESAI para que estas pudessem entre outubro e  novembro, analisar viabilidade técnica, financeira e legal das propostas.</p><p>A partir da devolutiva sobre viabilidade das propostas  elaboradas, as equipes dos DSEIS tiveram o mês de novembro para ajustar os  planos, que finalmente foram apresentados e submetidos à aprovação do Conselho  Distrital de Saúde Indígena (CONDISI) com posterior encaminhamento a Secretaria  Especial de Saúde Indígena para homologação, em ato realizado no mês de  dezembro.</p><p><br></p><p><img class="fr-fin fr-dib" alt="Figura 2 Fluxo de Elaboração dos Planos Distritais de Saúde Indígena" src="/images/Figura2.png" width="786" title="Figura 2 Fluxo de Elaboração dos Planos Distritais de Saúde Indígena"></p><p><br></p>', analise_situacional_4: '<p>A análise situacional do Distrito <strong>[NOME_DSEI]</strong> &nbsp;é o ponto de partida para o exercício de planejamento do futuro. Partir de um  bom diagnóstico compartilhado, entre gestão, trabalhadores e usuário, sobre as  especificidades do território é fundamental para entender as maiores  oportunidades e desafios que deverão nortear o planejamento para os próximos  anos. </p><p>Assim, o balanço do PDSI 2012-2015 (item 4.1) busca  registrar os avanços percebidos e as dificuldades enfrentadas pelo distrito no  período anterior. Essa análise deve contribuir com aprendizados que garantam a  aderência e a viabilidade dos resultados planejados. Os indicadores da saúde  indígena (item 4.2) permitem um diagnóstico preciso dos principais desafios  relacionados à saúde, assim como permitirão o acompanhamento da evolução das condições  de saúde no distrito. Os indicadores de saúde contribuem com informações  pertinentes que ajudam a priorização das ações mais urgentes. Considerando que  toda gestão enfrenta limites orçamentários, legais, de infraestrutura e de  recursos humanos, os indicadores proporcionam parâmetros que auxiliam na  escolha sobre como alocar esforços e recursos buscando maior efetividade das  ações.&nbsp; A partir desses dois conjunto de  informações e reflexões, o item 4.3 traz o registro dos principais desafios  para o período 2016-2019, que representam as escolhas estratégicas definidas e  debatidas junto ao controle social. </p>' },

  ])
end

if ResponsabilityLevel.count == 0
  ResponsabilityLevel.create!([
    { name: 'Resultado' },
    { name: 'Produto' },
    { name: 'Ação' },
  ])
end

if BudgetForecast.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'budget_forecasts.seed.csv')
  sql = <<-COPY_PSQL
    COPY budget_forecasts(cost_id, pdsi_id, initial_forecast_2016)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)

  # Create empty records for all costs
  (31..73).map do |cost_id|
    (1..34).map do |pdsi_id|
      BudgetForecast.create!([{ cost_id: cost_id, pdsi_id: pdsi_id, initial_forecast_2016: 0 }])
    end
  end
end


# Update initial forecasts for 2017-2019 based on correction factors of each year
BudgetForecast.find_by_sql("update budget_forecasts set initial_forecast_2017 = initial_forecast_2016 + (initial_forecast_2016*0.017)")
BudgetForecast.find_by_sql("update budget_forecasts set initial_forecast_2018 = initial_forecast_2016 + (initial_forecast_2016*0.02)")
BudgetForecast.find_by_sql("update budget_forecasts set initial_forecast_2019 = initial_forecast_2016 + (initial_forecast_2016*0.025)")

if BudgetCorrectionFactor.count == 0
  BudgetCorrectionFactor.create!([
    { year: 2017, value: 0.017 },
    { year: 2018, value: 0.020 },
    { year: 2019, value: 0.025 }
  ])
end

if CategoryBudget.count == 0
  CategoryBudget.create!([
    {projection_budget_category_id: 1, pdsi_id: 3},
    {projection_budget_category_id: 2, pdsi_id: 3},
    {projection_budget_category_id: 3, pdsi_id: 3}
  ])
end

if Investment.count == 0
  Investment.create!([
    { name: 'Obras de Edificações' },
    { name: 'Obras de Saneamento' },
    { name: 'Equipamentos' },
    { name: 'CASAI', parent_id: 1},
    { name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo I', parent_id: 1 },
    { name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo II', parent_id: 1 },
    { name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo III', parent_id: 1 },
    { name: 'SEDE DO NÚCLEO DISTRITAL DA SESAI', parent_id: 1 },
    { name: 'PÓLO-BASE', parent_id: 1 },
    { name: 'REFORMAS', parent_id: 1 },
    { name: 'SISTEMA DE ABASTECIMENTO DE ÁGUA (SAA)', parent_id: 2 },
    { name: 'MELHORIAS SANITÁRIAS DOMICILIARES (MSD)', parent_id: 2 },
    { name: 'ESGOTAMENTO SANITÁRIO', parent_id: 2 },
    { name: 'VEÍCULOS', parent_id: 3 },
    { name: 'BARCOS', parent_id: 3 },
    { name: 'MOTORES DE BARCO', parent_id: 3 },
    { name: 'GERADORES', parent_id: 3 },
    { name: 'EQUIPAMENTOS MÉDICO-HOSPITALARES (EMH)', parent_id: 3 },
    { name: 'EQUIPAMENTOS DE SANEAMENTO', parent_id: 3 },
    { name: 'MOBILIÁRIO', parent_id: 3 }
  ])
end

puts '------>> Done!.'
