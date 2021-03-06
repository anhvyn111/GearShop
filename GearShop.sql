USE [master]
GO
/****** Object:  Database [GearShop]    Script Date: 1/9/2022 11:44:42 AM ******/
CREATE DATABASE [GearShop]
GO
ALTER DATABASE [GearShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GearShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GearShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GearShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GearShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GearShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GearShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [GearShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GearShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GearShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GearShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GearShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GearShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GearShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GearShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GearShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GearShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GearShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GearShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GearShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GearShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GearShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GearShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GearShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GearShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GearShop] SET  MULTI_USER 
GO
ALTER DATABASE [GearShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GearShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GearShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GearShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GearShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GearShop] SET QUERY_STORE = OFF
GO
USE [GearShop]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/9/2022 11:44:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Username] [varchar](100) NOT NULL,
	[FullName] [nvarchar](200) NULL,
	[Password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/9/2022 11:44:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Quanlity] [int] NULL,
	[Price] [int] NULL,
	[CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/9/2022 11:44:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NULL,
	[FullName] [nvarchar](255) NULL,
	[Birth] [date] NULL,
	[Gender] [int] NULL,
	[PhoneNumber] [char](11) NULL,
	[Password] [varchar](200) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 1/9/2022 11:44:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](200) NULL,
	[MetaTitle] [varchar](200) NULL,
	[Display] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/9/2022 11:44:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Quanlity] [int] NULL,
	[Price] [bigint] NULL,
	[OrderID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/9/2022 11:44:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[MetaTitle] [varchar](max) NULL,
	[Price] [bigint] NULL,
	[PromotionPrice] [bigint] NULL,
	[CategoryID] [int] NULL,
	[Description] [ntext] NULL,
	[Detail] [ntext] NULL,
	[Quanlity] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](200) NULL,
	[ProductTag] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[UnsignName] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 1/9/2022 11:44:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NULL,
	[MetaTitle] [varchar](200) NULL,
	[MenuID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 1/9/2022 11:44:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [varchar](200) NULL,
	[ImagePath] [varchar](max) NULL,
	[ProductID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOrder]    Script Date: 1/9/2022 11:44:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[PhoneNumber] [char](11) NOT NULL,
	[TotalPrice] [bigint] NOT NULL,
	[PaymentMethod] [char](10) NOT NULL,
	[OrderDate] [datetime] NULL,
	[CustomerID] [int] NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([Username], [FullName], [Password]) VALUES (N'admin', N'Nguyễn Anh Vy', N'e10adc3949ba59abbe56e057f20f883e')
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [Birth], [Gender], [PhoneNumber], [Password], [Status]) VALUES (1, N'nguyenvydauxanh@gmail.com', N'Nguyễn Anh Vy', CAST(N'2000-01-20' AS Date), 0, N'0842181444 ', N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [Birth], [Gender], [PhoneNumber], [Password], [Status]) VALUES (2, N'batrinh@gmail.com', N'Nguyễn Lê Bá Trình', NULL, 0, NULL, N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [Birth], [Gender], [PhoneNumber], [Password], [Status]) VALUES (3, N'phamtuyetquyen@gmail.com', N'Phạm Thị Tuyết Quyên', NULL, NULL, NULL, N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [Birth], [Gender], [PhoneNumber], [Password], [Status]) VALUES (4, N'vana@gmail.com', N'Phạm Văn A', NULL, NULL, NULL, N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [Birth], [Gender], [PhoneNumber], [Password], [Status]) VALUES (5, N'vanb@gmail.com', N'Phạm Văn B', NULL, NULL, NULL, N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [Birth], [Gender], [PhoneNumber], [Password], [Status]) VALUES (8, N'vane@gmail.com', N'Nguyễn Van E', NULL, NULL, NULL, N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [Birth], [Gender], [PhoneNumber], [Password], [Status]) VALUES (9, N'vanf@gmail.com', N'Nguyễn Văn F', NULL, NULL, NULL, N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [Birth], [Gender], [PhoneNumber], [Password], [Status]) VALUES (10, N'anhvyn@gmail.com', N'Nguyễn Anh Vy', NULL, 0, N'0842181444 ', N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[Customer] ([CustomerID], [Email], [FullName], [Birth], [Gender], [PhoneNumber], [Password], [Status]) VALUES (11, N'vanj@gmail.com', N'Phạm Văn B', NULL, NULL, NULL, N'e10adc3949ba59abbe56e057f20f883e', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MenuID], [MenuName], [MetaTitle], [Display]) VALUES (2, N'Laptop', N'may-tinh-xach-tay', 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MetaTitle], [Display]) VALUES (3, N'Linh kiện', N'linh-kien', 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MetaTitle], [Display]) VALUES (5, N'Màn hình', N'man-hinh', 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [ProductID], [Quanlity], [Price], [OrderID]) VALUES (35, 1051, 1, 20990000, 21)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [Quanlity], [Price], [OrderID]) VALUES (36, 1053, 1, 590000, 21)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [Quanlity], [Price], [OrderID]) VALUES (37, 1051, 1, 20990000, 22)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [Quanlity], [Price], [OrderID]) VALUES (38, 1047, 1, 12990000, 23)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [Quanlity], [Price], [OrderID]) VALUES (39, 1053, 3, 590000, 24)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [Quanlity], [Price], [OrderID]) VALUES (40, 1037, 1, 6990000, 25)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [Quanlity], [Price], [OrderID]) VALUES (41, 1040, 1, 3500000, 26)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [Quanlity], [Price], [OrderID]) VALUES (42, 1048, 1, 17590000, 27)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [Quanlity], [Price], [OrderID]) VALUES (43, 1052, 1, 17090000, 28)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1036, N'GIGABYTE GeForce GTX 1650 MINI ITX OC 4G', N'gigabyte-geforce-gtx-1650-mini-itx-oc-4g', 6790000, NULL, 18, N'Hãng sản xuất: Gigabyte
Mã sản phẩm: GV-N1650IXOC-4GD
Bảo hành: 36 tháng', N'<h1><strong>Th&ocirc;ng số kỹ thuật :&nbsp;</strong></h1>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong>Chipset</strong></td>
			<td>GeForce&reg; GTX 1650</td>
		</tr>
		<tr>
			<td><strong>Core Clock</strong></td>
			<td>1680 MHz (Reference Card: 1665 MHz)</td>
		</tr>
		<tr>
			<td><strong>L&otilde;i CUDA</strong></td>
			<td>896</td>
		</tr>
		<tr>
			<td><strong>Memory Clock</strong></td>
			<td>8002 MHz</td>
		</tr>
		<tr>
			<td><strong>Dung lượng bộ nhớ</strong></td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td><strong>Chuẩn bộ nhớ</strong></td>
			<td>GDDR5</td>
		</tr>
		<tr>
			<td><strong>Giao diện bộ nhớ</strong></td>
			<td>128 bit</td>
		</tr>
		<tr>
			<td><strong>Băng th&ocirc;ng bộ nhớ (GB/gi&acirc;y)</strong></td>
			<td>128 GB/s</td>
		</tr>
		<tr>
			<td><strong>Card Bus</strong></td>
			<td>PCI-E 3.0 x 16</td>
		</tr>
		<tr>
			<td><strong>Độ ph&acirc;n giải</strong></td>
			<td>7680x4320@60Hz</td>
		</tr>
		<tr>
			<td><strong>Multi-view</strong></td>
			<td>3</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>L=152 W=114 H=36 mm</td>
		</tr>
		<tr>
			<td><strong>PCB Form</strong></td>
			<td>ATX</td>
		</tr>
		<tr>
			<td><strong>DirectX</strong></td>
			<td>12</td>
		</tr>
		<tr>
			<td><strong>OpenGL</strong></td>
			<td>4.6</td>
		</tr>
		<tr>
			<td><strong>Y&ecirc;u cầu nguồn tối thiểu</strong></td>
			<td>300W</td>
		</tr>
		<tr>
			<td><strong>D&acirc;y nguồn kết nối</strong></td>
			<td>N/A</td>
		</tr>
		<tr>
			<td><strong>Cổng kết nối</strong></td>
			<td>DisplayPort 1.4 *1<br />
			HDMI 2.0b *2</td>
		</tr>
		<tr>
			<td><strong>SLI support</strong></td>
			<td>No</td>
		</tr>
		<tr>
			<td><strong>Accessories</strong></td>
			<td>1. Quick guide<br />
			2. Driver CD</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết</strong></h2>

<p>&nbsp;</p>

<p>GIGABYTE GeForce&reg; GTX 1650 MINI ITX OC 4G (N1650IXOC-4GD)</p>

<p>GeForce GTX 1650 4GB GDDR5 Mini ITX OC l&agrave; mẫu card m&agrave;n h&igrave;nh tầm trung mới nhất của GIGABYTE, với hiệu năng chơi game được cải thiện rất nhiều so với thế hệ trước l&agrave; GTX 1050Ti đem lại trải nghiệm chơi game mượt m&agrave; tr&ecirc;n độ ph&acirc;n giải full HD.&nbsp;Phi&ecirc;n bản GTX 1650 n&agrave;y đ&atilde; được &eacute;p xung sẵn nhằm đem lại hiệu năng chơi game tốt hơn.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-vga-gigabyte-geforce-gtx-1650-mini-itx-oc-4g-1_b74e935fceb74226bec57a5d41ce6609_grande.png" /></p>

<h3><strong>Thiết kế</strong></h3>

<p>GeForce GTX 1650 4GB GDDR5 Mini ITX OC sử dụng thiết kế nhỏ gọn với quạt l&agrave;m m&aacute;t c&oacute; k&iacute;ch thước 80mm, đảm bảo duy tr&igrave; nhiệt độ hoạt động ổn định. Với độ d&agrave;i chỉ c&oacute; 170mm, cực k&igrave; ph&ugrave; hợp với c&aacute;c kiểu case m&aacute;y t&iacute;nh nhỏ gọn.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-vga-gigabyte-geforce-gtx-1650-mini-itx-oc-4g-2_dc78f17ebea84d69a69d0cbcbe18e4ce_grande.png" /></p>

<p>GTX 1650 4GB GDDR5 Mini ITX OC được trang bị quạt l&agrave;m m&aacute;t với c&aacute;c r&atilde;nh hướng gi&oacute; đặc biệt gi&uacute;p tối ưu luồng gi&oacute; đi qua c&aacute;nh quạt.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-vga-gigabyte-geforce-gtx-1650-mini-itx-oc-4g-3_212ff0cb458247a0bb0ea16007bc59c5_grande.png" /></p>

<p>Nhằm đảm bảo khả năng hoạt động ổn định nhất, bộ cấp nguồn tr&ecirc;n GeForce GTX 1650 4GB GDDR5 Mini ITX OC đ&atilde; được c&aacute;c kĩ sư của GIGABYTE thiết kế lại với linh kiện cao cấp. Gi&uacute;p tối ưu hiệu năng v&agrave; nhiệt độ hoạt động, vốn l&agrave; điều cực k&igrave; quan trọng khi chơi game v&agrave; &eacute;p xung.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-vga-gigabyte-geforce-gtx-1650-mini-itx-oc-4g-4_89e89c629d0c42d4bea8c32d1ca0f86b_grande.png" /></p>

<h3><strong>Phần mềm</strong></h3>

<p>Với phần mềm AORUS Engine của GIGABYTE, game thủ c&oacute; thể theo d&otilde;i t&igrave;nh trạng hoạt động của GeForce GTX 1650 4GB GDDR5 Mini ITX OC v&agrave; t&ugrave;y chỉnh, &eacute;p xung để c&oacute; được hiệu năng ưng &yacute; nhất.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-vga-gigabyte-geforce-gtx-1650-mini-itx-oc-4g-5_198ce77f711e4dc3ad700e6db1f5313c_grande.png" /></p>
', 100, CAST(N'2022-01-08T22:54:37.220' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1037, N'INNO3D Geforce GTX 1650 GDDR6 Twin X2 OC', N'inno3d-geforce-gtx-1650-gddr6-twin-x2-oc', 6990000, NULL, 18, N'Nhà sản xuất: INNO3D
Mã sản phẩm: N16502-04D6X-1177VA25
Bảo hành: 36 tháng', N'<p><strong>Th&ocirc;ng số kỹ thuật</strong></p>

<table align="center" border="1" cellspacing="0">
	<tbody>
		<tr>
			<td>Xử l&yacute; đồ họa</td>
			<td>GeForce GTX 1650</td>
		</tr>
		<tr>
			<td>Đồng hồ l&otilde;i</td>
			<td>1620 MHz</td>
		</tr>
		<tr>
			<td>CUDA&reg; Cores</td>
			<td>896</td>
		</tr>
		<tr>
			<td>Đồ hồ bộ nhớ</td>
			<td>12000 MHz</td>
		</tr>
		<tr>
			<td>Dung lượng bộ nhớ</td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td>Loại bộ nhớ</td>
			<td>GDDR5</td>
		</tr>
		<tr>
			<td>Bus bộ nhớ</td>
			<td>128 bit</td>
		</tr>
		<tr>
			<td>Băng th&ocirc;ng bộ nhớ (GB / gi&acirc;y)</td>
			<td>128 GB/s</td>
		</tr>
		<tr>
			<td>Thẻ Bus</td>
			<td>PCI-E 3.0 x 16</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải kỹ thuật số tối đa</td>
			<td>7680x4320</td>
		</tr>
		<tr>
			<td>M&agrave;n h&igrave;nh hiển thị tối đa</td>
			<td>4</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>L=196 W=113 H=51 mm</td>
		</tr>
		<tr>
			<td>Mẫu PCB</td>
			<td>ATX</td>
		</tr>
		<tr>
			<td>DirectX</td>
			<td>12 Ultimate</td>
		</tr>
		<tr>
			<td>OpenGL</td>
			<td>4.6</td>
		</tr>
		<tr>
			<td>PSU được đề xuất</td>
			<td>300W</td>
		</tr>
		<tr>
			<td>Đầu ra</td>
			<td>DisplayPort 1.4a *2<br />
			HDMI 2.0 *1</td>
		</tr>
		<tr>
			<td>Hỗ trợ SLI</td>
			<td>N/A</td>
		</tr>
	</tbody>
</table>

<p style="text-align:center">&nbsp;</p>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết INNO3D Geforce GTX 1650 GDDR6 Twin X2 OC</strong></h2>

<p>INNO3D Geforce GTX 1650 GDDR6 Twin X2 OC&nbsp;l&agrave;&nbsp;VGA tầm trung tr&ecirc;n nền tảng NVIDIA GeForce GTX 1650 &aacute;p dụng c&ocirc;ng nghệ tự th&iacute;ch ứng v&agrave; kiến ​​tr&uacute;c bộ nhớ t&iacute;ch hợp mới, cải thiện hiệu suất đ&aacute;ng ngạc nhi&ecirc;n trong c&aacute;c tr&ograve; chơi hiện tại, đ&aacute;p ứng mọi nhu cầu của người d&ugrave;ng.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://product.hstatic.net/1000026716/product/gearvn.com-products-inno3d-geforce-gtx-1650-gddr6-twin-x2-oc_1_bf84432860ed4cf5978c4fafcd05c144_large.jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>VGA&nbsp;t&iacute;ch hợp 2 quạt tản nhiệt 90mm c&oacute; thể điều chỉnh tốc độ, hệ thống v&acirc;y l&agrave;m m&aacute;t kim loại cho hiệu quả tản nhiệt tối đa, hoạt động &ecirc;m &aacute;i v&agrave; kh&ocirc;ng c&oacute; tiếng ồn khi tải thấp, chạy ở hiệu năng cao m&agrave; vẫn duy tr&igrave; nhiệt độ ổn định ở mức thấp.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://product.hstatic.net/1000026716/product/gearvn.com-products-inno3d-geforce-gtx-1650-gddr6-twin-x2-oc_3_ab6051fca37c468cb9054aaf0f1c8fff_large.jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>C&oacute; c&ocirc;ng nghệ hỗ trợ GeForce GTX 1650 4G kết hợp hiệu năng, thiết kế v&agrave; hiệu quả năng lượng với nhau, điều n&agrave;y l&agrave;m cho sản phẩm trở th&agrave;nh một lựa chọn l&yacute; tưởng cho nền tảng PC hiệu suất cao.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://product.hstatic.net/1000026716/product/gearvn.com-products-inno3d-geforce-gtx-1650-gddr6-twin-x2-oc_2_8d5e1191550e44d08146e88b5f430f17_large.jpg" /></p>

<p>&nbsp;</p>

<p>Quy tr&igrave;nh sản xuất ho&agrave;n to&agrave;n tự động đảm bảo chất lượng h&agrave;ng đầu của bảng mạch v&agrave; loại bỏ những chỗ lồi l&otilde;m sắc n&eacute;t của c&aacute;c đầu nối h&agrave;n được nh&igrave;n thấy tr&ecirc;n bề mặt PCB th&ocirc;ng thường. Thiết kế th&acirc;n thiện n&agrave;y gi&uacute;p tay bạn kh&ocirc;ng bị cắt hoặc v&ocirc; t&igrave;nh l&agrave;m hỏng c&aacute;c bộ phận khi chế tạo.</p>

<p>Phần mềm Inno3D Graphic Engine sẽ gi&uacute;p bạn dễ d&agrave;ng điều chỉnh c&aacute;c th&ocirc;ng số cơ bản của&nbsp;VGA&nbsp;hay tốc độ quạt.&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://product.hstatic.net/1000026716/product/gearvn.com-products-inno3d-geforce-gtx-1650-gddr6-twin-x2-oc_973390fad5ef49009a6eda7cbbe4960a_large.jpg" /></p>
', 99, CAST(N'2022-01-08T22:57:33.500' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1038, N'GIGABYTE GeForce GTX 1650 OC 4G', N'gigabyte-geforce-gtx-1650-oc-4g', 6990000, NULL, 18, N'Nhà sản xuất: GIGABYTE
Mã sản phẩm: GV-N1650OC-4GD
Bảo hành: 36 tháng', N'<p><strong>Th&ocirc;ng số kỹ thuật:&nbsp;</strong></p>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong>GPU:</strong></td>
			<td>GeForce&reg; GTX 1650</td>
		</tr>
		<tr>
			<td><strong>GPU Clock:</strong></td>
			<td>1710 MHz (Reference Card: 1665 MHz)</td>
		</tr>
		<tr>
			<td><strong>Số lượng đơn vị xử l&yacute;:</strong></td>
			<td>896</td>
		</tr>
		<tr>
			<td><strong>Memory Clock:</strong></td>
			<td>8002 MHz</td>
		</tr>
		<tr>
			<td><strong>Bộ nhớ:</strong></td>
			<td>4 GB&nbsp;GDDR5</td>
		</tr>
		<tr>
			<td><strong>Giao diện bộ nhớ:</strong></td>
			<td>128 bit</td>
		</tr>
		<tr>
			<td><strong>Memory Bandwidth (GB/sec):</strong></td>
			<td>128 GB/s</td>
		</tr>
		<tr>
			<td><strong>Chuẩn Bus:</strong></td>
			<td>PCI-E 3.0 x 16</td>
		</tr>
		<tr>
			<td><strong>Độ ph&acirc;n giải tối đa:</strong></td>
			<td>7680x4320@60Hz</td>
		</tr>
		<tr>
			<td><strong>Số lượng m&agrave;n h&igrave;nh hỗ trợ:</strong></td>
			<td>3</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước chuẩn:</strong></td>
			<td>L=191 W=112 H=36 mm</td>
		</tr>
		<tr>
			<td><strong>DirectX:</strong></td>
			<td>12</td>
		</tr>
		<tr>
			<td><strong>OpenGL:</strong></td>
			<td>4.6</td>
		</tr>
		<tr>
			<td><strong>Nguồn tối thiểu:</strong></td>
			<td>300W</td>
		</tr>
		<tr>
			<td><strong>Power Connectors:</strong></td>
			<td>N/A</td>
		</tr>
		<tr>
			<td><strong>Cổng giao tiếp:</strong></td>
			<td>DisplayPort 1.4 *1<br />
			HDMI 2.0b *2</td>
		</tr>
		<tr>
			<td><strong>SLI support:</strong></td>
			<td>No</td>
		</tr>
		<tr>
			<td><strong>Phụ kiện:</strong></td>
			<td>1. S&aacute;ch hướng dẫn<br />
			2. Đĩa CD Driver</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết card m&agrave;n h&igrave;nh GIGABYTE GeForce GTX 1650 OC 4G</strong></h2>

<p>Card m&agrave;n h&igrave;nh hay card đồ họa l&agrave; một trong những&nbsp;<a href="https://gearvn.com/pages/linh-kien-may-tinh" target="_blank">linh kiện m&aacute;y t&iacute;nh</a>&nbsp;kh&ocirc;ng thể thiếu nếu như bạn l&agrave; người th&iacute;ch chơi game hay chuy&ecirc;n l&agrave;m thiết kế. GIGABYTE GeForce GTX 1650 OC 4G sẽ l&agrave; th&agrave;nh phần quan trọng nhất trong việc tr&igrave;nh xuất dữ liệu h&igrave;nh ảnh v&agrave; video. Bạn sẽ cảm nhận r&otilde; rệt sự kh&aacute;c biệt khi d&agrave;n m&aacute;y của m&igrave;nh được trang bị card m&agrave;n h&igrave;nh xịn x&ograve; đến thế.</p>

<p style="text-align:center"><img alt="GEARVN GIGABYTE GeForce GTX 1650 OC 4G" src="https://file.hstatic.net/1000026716/file/gearvn-gigabyte-geforce-gtx-1650-oc-4g-1_63e91d5cd6894eb8a46cd93ac5b1d96e_grande.png" /></p>

<h3><strong>Tản nhiệt với hệ thống WINDFORCE 2X</strong></h3>

<p><a href="https://gearvn.com/collections/vga-card-man-hinh" target="_blank">VGA</a>&nbsp;GIGABYTE được trang bị hệ thống l&agrave;m m&aacute;t WINDFORCE 2X với c&aacute;nh quạt l&agrave; 2x 80mm hiệu quả. Quạt c&oacute; chế độ quay lu&acirc;n phi&ecirc;n đồng thời hoạt động 3D mang lại khả năng tản nhiệt đến d&agrave;n m&aacute;y cực tốt.&nbsp;</p>

<p><img alt="GEARVN GIGABYTE GeForce GTX 1650 OC 4G" src="https://file.hstatic.net/1000026716/file/gearvn-gigabyte-geforce-gtx-1650-oc-4g-6_323425dd472b42bd9153376b7f6b8c6d_1024x1024.jpg" /></p>

<ul>
	<li><strong>Quạt quay lu&acirc;n phi&ecirc;n</strong></li>
</ul>

<p><a href="https://gearvn.com/collections/laptop-gaming-gigabyte" target="_blank">GIGABYTE</a>&nbsp;thực hiện giải ph&aacute;p để những c&aacute;nh quạt lu&acirc;n phi&ecirc;n hoạt động cho luồng kh&ocirc;ng kh&iacute; được đẩy ra tốt hơn bao giờ hết. C&aacute;c quạt đặt liền kề nhau quay c&ugrave;ng chiều đ&atilde; tạo ra một sức mạnh đẩy hướng gi&oacute; đi mượt m&agrave; hơn. Từ đ&oacute; hệ thống đạt được mức độ tản nhiệt tối ưu nhất.&nbsp;</p>

<p style="text-align:center"><img alt="GEARVN GIGABYTE GeForce GTX 1650 OC 4G" src="https://file.hstatic.net/1000026716/file/gearvn-gigabyte-geforce-gtx-1650-oc-4g-7_d0f075dd9d3c405cb972d6d8847c123c.jpg" /></p>

<ul>
	<li>
	<p><strong>C&aacute;nh quạt độc đ&aacute;o</strong></p>
	</li>
</ul>

<p>C&aacute;nh quạt từ VGA GIGABYTE c&oacute; phần m&eacute;p h&igrave;nh tam gi&aacute;c hơi tr&agrave;n ra phần ngo&agrave;i một ch&uacute;t. Đ&acirc;y ch&iacute;nh l&agrave; chủ &yacute; của h&atilde;ng cho việc dẫn hướng gi&oacute; lưu th&ocirc;ng mượt m&agrave; hơn c&ugrave;ng với c&aacute;c đường cong sọc 3D tr&ecirc;n bề mặt.</p>

<p style="text-align:center"><img alt="GEARVN GIGABYTE GeForce GTX 1650 OC 4G" src="https://file.hstatic.net/1000026716/file/gearvn-gigabyte-geforce-gtx-1650-oc-4g-8_7a6e785b0fb54adfab8254a19c5e7567.jpg" /></p>

<ul>
	<li><strong>Quạt hoạt động 3D</strong></li>
</ul>

<p>Mang đến cho người d&ugrave;ng thiết bị hoạt động b&aacute;n thụ động. Khi GPU nhận thấy nhiệt độ ở mức năng lượng thấp sẽ tự động ngắt. Đồng thời khi nhiệt độ cao trong qu&aacute; tr&igrave;nh chơi game hay l&agrave;m việc với năng suất cao sẽ tự động quay trở lại. Vừa tiết kiệm năng lượng vừa mang tới kh&ocirc;ng gian l&agrave;m việc thoải m&aacute;i cho người d&ugrave;ng.</p>

<p style="text-align:center"><img alt="GEARVN GIGABYTE GeForce GTX 1650 OC 4G" src="https://file.hstatic.net/1000026716/file/gearvn-gigabyte-geforce-gtx-1650-oc-4g-9_524e2aaffc3f4b7ea47ff0e360e75c1a.jpg" /></p>

<h3><strong>Mang tới card m&agrave;n h&igrave;nh hoạt động mạnh mẽ nhất&nbsp;</strong></h3>

<p>C&aacute;c Mosfet c&oacute; RDS thấp được thiết kế để tạo ra điện trở chuyển mạch thấp hơn. Từ đ&oacute; sạc hay xả d&ograve;ng điện nhanh hơn ở nhiệt độ thấp. C&aacute;c cuộn cảm kim loại giữ năng lượng l&acirc;u hơn ở tần số cao, giảm đi c&aacute;c vấn đề g&acirc;y tổn thất năng lượng l&otilde;i cũng như nhiễu EMI. Tụ ESR thể rắn đảm bảo dẫn điện si&ecirc;u tốt cho hệ thống hiệu suất l&agrave;m việc tuyệt vời.&nbsp;</p>

<p><img alt="GEARVN GIGABYTE GeForce GTX 1650 OC 4G" src="https://file.hstatic.net/1000026716/file/gearvn-gigabyte-geforce-gtx-1650-oc-4g-10_c782192ce1e9477f9b41e25eea5047b0_1024x1024.jpg" /></p>

<h3><strong>Sử dụng phần mềm AORUS Engine trong GIGABYTE GeForce GTX 1650 OC 4G</strong></h3>

<p>Giờ đ&acirc;y, c&aacute;c game thủ c&oacute; thể tự m&igrave;nh theo d&otilde;i t&igrave;nh trạng hoạt động của VGA th&ocirc;ng qua phần mềm AORUS Engine. Tự do điều chỉnh hiệu suất &eacute;p xung để ph&ugrave; hợp với nhu cầu sử dụng.</p>

<p style="text-align:center"><img alt="GEARVN GIGABYTE GeForce GTX 1650 OC 4G" src="https://file.hstatic.net/1000026716/file/gearvn-gigabyte-geforce-gtx-1650-oc-4g-11_59d4de72292844cca3782fff8d086385.jpg" /></p>

<p>Thật thiếu x&oacute;t nếu bỏ qua chiếc card m&agrave;n h&igrave;nh chất lượng như thế n&agrave;y trong hệ thống PC của bạn. Sở hữu ngay để c&oacute; những trải nghiệm về h&igrave;nh ảnh v&agrave; video trọn vẹn nhất từ trước đến nay.</p>
', 100, CAST(N'2022-01-08T23:00:20.640' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1039, N'GIGABYTE GeForce RTX 3070 Ti EAGLE 8G', N'gigabyte-geforce-rtx-3070-ti-eagle-8g', 28490000, NULL, 18, N'Hãng sản xuất: GIGABYTE
Mã sản phẩm: GV-N307TEAGLE-8GD
Bảo hành: 36 Tháng', N'<h3><strong>TH&Ocirc;NG SỐ KỸ&nbsp;THUẬT</strong></h3>

<table align="center" border="1" cellspacing="0">
	<tbody>
		<tr>
			<td>ĐƠN VỊ XỬ L&Yacute; ĐỒ HỌA</td>
			<td>GeForce RTX&trade; 3070 Ti</td>
		</tr>
		<tr>
			<td>ĐỒNG HỒ L&Otilde;I</td>
			<td>1770 MHz</td>
		</tr>
		<tr>
			<td>NH&Acirc;N CUDA</td>
			<td>6144</td>
		</tr>
		<tr>
			<td>TỐC ĐỘ BỘ NHỚ</td>
			<td>1&lrm;9000 MHz</td>
		</tr>
		<tr>
			<td>&nbsp;BỘ NHỚ RAM</td>
			<td>8 GB</td>
		</tr>
		<tr>
			<td>BỘ NHỚ</td>
			<td>GDDR6X</td>
		</tr>
		<tr>
			<td>BỘ NHỚ BUS</td>
			<td>256 bit</td>
		</tr>
		<tr>
			<td>TỐC ĐỘ TRUYỀN TẢI</td>
			<td>608 GB/s</td>
		</tr>
		<tr>
			<td>GIAO DIỆN</td>
			<td>PCI-E 4.0 x 16</td>
		</tr>
		<tr>
			<td>ĐỘ PH&Acirc;N GIẢI TỐI ĐA KỸ THUẬT SỐ</td>
			<td>7&lrm;680x4320</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/pages/man-hinh" target="_blank">M&Agrave;N H&Igrave;NH M&Aacute;Y T&Iacute;NH</a>&nbsp;HIỂN THỊ TỐI ĐA</td>
			<td>4</td>
		</tr>
		<tr>
			<td>K&Iacute;CH THƯỚC</td>
			<td>L=283 W=115 H=50 mm</td>
		</tr>
		<tr>
			<td>K&Iacute;CH THƯỚC MẠCH</td>
			<td>ATX</td>
		</tr>
		<tr>
			<td>HỖ TRỢ PHI&Ecirc;N BẢN&nbsp;DIRECTX</td>
			<td>1&lrm;2 Ultimate</td>
		</tr>
		<tr>
			<td>HỖ TRỢ PHI&Ecirc;N BẢN OPENGL</td>
			<td>4&lrm;.6</td>
		</tr>
		<tr>
			<td>PSU ĐƯỢC ĐỀ XUẤT</td>
			<td>7&lrm;50W</td>
		</tr>
		<tr>
			<td>ĐẦU NỐI NGUỒN</td>
			<td>8&lrm; pin*2</td>
		</tr>
		<tr>
			<td>ĐẦU RA</td>
			<td>DisplayPort 1.4a *2<br />
			HDMI 2.1 *2</td>
		</tr>
		<tr>
			<td>HỖ TRỢ SLI</td>
			<td>N/A</td>
		</tr>
	</tbody>
</table>

<h2><strong>Card m&agrave;n h&igrave;nh&nbsp;GIGABYTE GeForce RTX 3070 Ti EAGLE 8G</strong></h2>

<p>&nbsp;</p>

<p>Card m&agrave;n h&igrave;nh&nbsp;Gigabyte GeForce RTX&trade; 3070 Ti EAGLE OC 8GB l&agrave; một trong những sản phẩm mới nhất vừa được ra mắt gần đ&acirc;y của c&aacute;c d&ograve;ng RTX của nh&agrave; Gigabyte. Tuy mang vẻ ngo&agrave;i đơn giản v&agrave; kh&ocirc;ng qu&aacute; kh&aacute;c biệt c&aacute;c d&ograve;ng trước nhưng hiệu năng n&oacute; kh&ocirc;ng thua k&eacute;m g&igrave; &quot;người anh&quot; AORUS đ&acirc;u nh&eacute;.&nbsp;</p>

<p>&nbsp;</p>

<h3><strong>Hệ thống tản nhiệt Windforce 3X</strong></h3>

<p>&nbsp;</p>

<p>Hệ thống l&agrave;m m&aacute;t WINDFORCE 3X c&oacute; ba quạt c&aacute;nh độc đ&aacute;o 80mm, quay lu&acirc;n phi&ecirc;n, 6 ống dẫn nhiệt bằng đồng hỗn hợp chạm trực tiếp v&agrave;o GPU, quạt hoạt động 3D v&agrave; l&agrave;m m&aacute;t m&agrave;n h&igrave;nh c&ugrave;ng nhau cung cấp khả năng tản nhiệt hiệu quả cao.</p>

<p style="text-align:center"><img src="https://product.hstatic.net/1000026716/product/3_6b06537934af4063bbb702302df6969c_large.png" /></p>

<p>&nbsp;</p>

<p>Nh&agrave;&nbsp;GIGABYTE xoay c&aacute;c quạt liền kề theo hướng ngược lại, để hướng luồng kh&ocirc;ng kh&iacute; giữa hai quạt l&agrave; như nhau, giảm sự nhiễu loạn v&agrave; tăng cường &aacute;p suất luồng kh&ocirc;ng kh&iacute;.</p>

<p style="text-align:center"><img src="https://product.hstatic.net/1000026716/product/5_394177e719274f5caac2d465c94ec2fb_large.png" /></p>

<h3><strong>Độ ho&agrave;n thiện chi tiết</strong></h3>

<p>Quy tr&igrave;nh sản xuất ho&agrave;n to&agrave;n tự động đảm bảo chất lượng h&agrave;ng đầu của bảng mạch v&agrave; loại bỏ những chỗ lồi l&otilde;m sắc n&eacute;t của c&aacute;c đầu nối h&agrave;n được nh&igrave;n thấy tr&ecirc;n bề mặt PCB th&ocirc;ng thường. Thiết kế th&acirc;n thiện n&agrave;y gi&uacute;p tay bạn kh&ocirc;ng bị cắt hoặc v&ocirc; t&igrave;nh l&agrave;m hỏng c&aacute;c bộ phận khi lắp đặt.Tấm lưng kim loại kh&ocirc;ng chỉ mang lại h&igrave;nh d&aacute;ng thẩm mỹ m&agrave; c&ograve;n n&acirc;ng cao cấu tr&uacute;c của card đồ họa để bảo vệ to&agrave;n diện.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://www.gigabyte.com/FileUpload/Global/KeyFeature/1873/innergigabyteimages/eagle/69.jpg" /></p>

<p style="text-align:center">&nbsp;</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://product.hstatic.net/1000026716/product/7_8614344fa1f74d77a3eb05405ebc8ad4_large.png" /></p>

<p>&nbsp;</p>

<h3><strong>LED RGB FUSION 2.0 SOFTWARE</strong></h3>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Card m&agrave;n h&igrave;nh&nbsp;GIGABYTE GeForce RTX 3070 Ti EAGLE 8G vẫn c&ograve;n giữ lại hệ thống phần mềm chỉnh led RGB th&ocirc;ng qua phần mềm&nbsp;RGB FUSION 2.0 để người d&ugrave;ng dễ d&agrave;ng thay đổi m&agrave;u sắc của thiết bị tr&ocirc;ng bắt mắt v&agrave; đẹp hơn với 16.7 triệu m&agrave;u</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://product.hstatic.net/1000026716/product/6_14f8b82faf9e4eb8b23c7b29067f6115_large.png" /></p>

<p>&nbsp;</p>

<h1><strong>H&igrave;nh ảnh chi tiết VGA Asus Dual GeForce RTX 3070 O8G</strong></h1>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://product.hstatic.net/1000026716/product/8_90514ef860774322b7b75ce6630b32b7_large.png" /><img src="https://product.hstatic.net/1000026716/product/4_4c52d617f79a4cf3906459205d4b709c_large.png" /><img src="https://product.hstatic.net/1000026716/product/3_6b06537934af4063bbb702302df6969c_large.png" /><img src="https://product.hstatic.net/1000026716/product/6_14f8b82faf9e4eb8b23c7b29067f6115_large.png" /></p>
', 50, CAST(N'2022-01-08T23:02:55.293' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1040, N'Màn hình HKC MB24V9 24" IPS 75Hz', N'man-hinh-hkc-mb24v9-24-ips-75hz', 3500000, NULL, 2, N'Nhà sản xuất : HKC
Tình trạng : NEW - 100%
Bảo hành : 24 tháng', N'<p><strong>Th&ocirc;ng số kỹ thuật</strong></p>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong>H&atilde;ng sản xuất</strong></td>
			<td>HKC</td>
		</tr>
		<tr>
			<td><strong>Model</strong></td>
			<td>MB24V9</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước m&agrave;n h&igrave;nh</strong></td>
			<td>23.8 inch</td>
		</tr>
		<tr>
			<td><strong>Độ ph&acirc;n giải</strong></td>
			<td>FHD&nbsp;1920 x 1080</td>
		</tr>
		<tr>
			<td><strong>Tấm nền</strong></td>
			<td>IPS</td>
		</tr>
		<tr>
			<td><strong>Tỉ lệ</strong></td>
			<td>16:9</td>
		</tr>
		<tr>
			<td><strong>Tần số qu&eacute;t</strong></td>
			<td>75hz</td>
		</tr>
		<tr>
			<td><strong>Độ s&aacute;ng</strong></td>
			<td>220 cd/m2</td>
		</tr>
		<tr>
			<td><strong>Khả năng hiển thị m&agrave;u sắc</strong></td>
			<td>16.7 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td><strong>Thời gian đ&aacute;p ứng</strong></td>
			<td>8ms (GTG)</td>
		</tr>
		<tr>
			<td><strong>G&oacute;c nh&igrave;n</strong></td>
			<td>178&deg;(H)/178&deg;(V)</td>
		</tr>
		<tr>
			<td><strong>Cổng kết nối</strong></td>
			<td>VGA | HDMI</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>4.1kg</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>627x397x128mm</td>
		</tr>
		<tr>
			<td><strong>Phụ kiện</strong></td>
			<td>Adapter | HDMI cable</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết</strong></h2>

<p>&nbsp;</p>

<h3><strong>Đặc điểm của m&agrave;n h&igrave;nh LCD HKC MB24V9 23.8inch 75Hz FHD IPS</strong></h3>

<p>M&agrave;n h&igrave;nh HKC MB24V9 được thiết kế với đường viền hẹp mang lại một diện mạo mượt, v&agrave; cho ph&eacute;p giảm đi sự xao nh&atilde;ng, c&ugrave;ng k&iacute;ch thước xem tối đa.&nbsp;</p>

<p>Đặc biệt, rất th&iacute;ch hợp trong việc thiết lập ra nhiều&nbsp;<a href="https://gearvn.com/pages/man-hinh" target="_blank">m&agrave;n h&igrave;nh</a>&nbsp;hoặc xếp l&aacute;t như trong game, thiết kế đồ hoạ hoặc c&aacute;c dứng dụng chuy&ecirc;n nghiệp. M&agrave;n h&igrave;nh với đường việc thiết kế si&ecirc;u đẹp mang lại cho bạn với những trải nghiệm mới, c&oacute; cảm gi&aacute;c như sử dụng một m&agrave;n h&igrave;nh lớn.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-hkc-mb24v9-24-ips-75hz-2_f53c0c0e9209449fa1f0c539baaf382e_grande.jpg" /></p>

<h3><strong>Tỷ lệ tương phản 3000:1</strong></h3>

<p>Tỷ lệ tương phản mang lại cao nhất 3000:1 c&oacute; hiệu năng cao v&agrave; độ s&aacute;ng tầm 250cd/m2. Sản phẩm đ&atilde; gi&uacute;p bạn c&oacute; được nhiều sự lựa chọn mới để tuỳ chỉnh về độ s&aacute;ng cũng như về độ sắc n&eacute;t của m&agrave;n h&igrave;nh, gi&uacute;p việc hiển thị cho ra chất lượng h&igrave;nh ảnh si&ecirc;u r&otilde; n&eacute;t sống động như thật.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-hkc-mb24v9-24-ips-75hz-3_ca7c9399b7734e4d91d1305abf51631d_grande.jpg" /></p>

<h3><strong>Độ ph&acirc;n giải FHD với g&oacute;c nh&igrave;n lớn</strong></h3>

<p>M&agrave;n h&igrave;nh HKC được sử dụng với c&ocirc;ng nghệ ti&ecirc;n tiến nhất, gi&uacute;p bạn tỷ lệ tương phản với tĩnh kh&aacute; cao. Th&ecirc;m v&agrave;o đ&oacute; gi&uacute;p tạo ra h&igrave;nh ảnh rực rỡ v&agrave; sống động hơn rất nhiều, th&iacute;ch hợp cho h&igrave;nh ảnh, duyệt web, phim, tr&ograve; chơi v&agrave; tất cả những ứng dụng lu&ocirc;n đ&ograve;i hỏi về đồ hoạ cao. Kết hợp theo đ&oacute; c&ocirc;ng nghệ quản l&yacute; về điểm ảnh tối ưu cho tất cả c&aacute;c bạn một g&oacute;c nh&igrave;n rộng lớn 178/178 độ, gi&uacute;p bạn c&oacute; được h&igrave;nh ảnh sinh động.</p>

<p>Đặc biệt, tất cả c&aacute;c sản phẩm đều mang lại chất lượng h&igrave;nh ảnh vượt trội, gi&uacute;p mang lại độ ph&acirc;n giải FHD đầy đủ k&iacute;ch thước: 1920 x 1080 pixel n&acirc;ng cao. Cho ra c&aacute;c chi tiết sinh động đi c&ugrave;ng với độ s&aacute;ng cao, độ tương phản đến kh&ocirc;ng thể tin được v&agrave; m&agrave;u sắc trung thực cho c&aacute;c h&igrave;nh ảnh sống động giống như ngo&agrave;i đời thực.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-hkc-mb24v9-24-ips-75hz-4_9ce74bd3a4374b3a97e12d0c8361140f_grande.jpg" /></p>

<h3><strong>Cổng kết nối VGA/HDMI</strong></h3>

<p>Kh&ocirc;ng chỉ c&oacute; thế, thiết bị để t&iacute;ch hợp cồng kết nối VGA/HDMI gi&uacute;p truyền tải tất cả chất lượng của h&igrave;nh ảnh như: m&agrave;u sắc, độ ph&acirc;n giải hoặc th&ocirc;ng số về video. Nhằm cung cấp cho người đọc với c&aacute;c h&igrave;nh ảnh ch&acirc;n thực v&agrave; sống động nhất.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-hkc-mb24v9-24-ips-75hz-5_44d0cf40268145a58df2b9eaf59c4525_grande.jpg" /></p>
', 99, CAST(N'2022-01-08T23:04:34.367' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1041, N'Màn hình AOC 24B1XH5 24" IPS 75Hz FHD', N'man-hinh-aoc-24b1xh5-24-ips-75hz-fhd', 3550000, NULL, 2, N'Nhà sản xuất : AOC
Tình trạng : NEW - 100%
Bảo hành : 36 tháng.', N'<p>&nbsp;</p>

<table border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td>16:9</td>
		</tr>
		<tr>
			<td><strong>Độ ph&acirc;n giải</strong></td>
			<td>FHD 1920x1080</td>
		</tr>
		<tr>
			<td><strong>Tấm nền</strong></td>
			<td>IPS</td>
		</tr>
		<tr>
			<td><strong>Tần số qu&eacute;t</strong></td>
			<td>75Hz&nbsp;</td>
		</tr>
		<tr>
			<td><strong>Thời gian phản hồi</strong></td>
			<td>8ms (GtG)</td>
		</tr>
		<tr>
			<td><strong>Độ tương phản</strong></td>
			<td>1000:1 (điển h&igrave;nh) 20 Triệu: 1 (DCR)</td>
		</tr>
		<tr>
			<td><strong>Độ s&aacute;ng</strong></td>
			<td>250 cd / m&sup2;</td>
		</tr>
		<tr>
			<td><strong>G&oacute;c nh&igrave;n</strong></td>
			<td>178 &deg; (H) / 178 &deg; (V) (CR&gt; 10)</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u sắc m&agrave;n h&igrave;nh</strong></td>
			<td>sRGB</td>
		</tr>
		<tr>
			<td><strong>Bề mặt m&agrave;n h&igrave;nh</strong></td>
			<td>Nh&aacute;m</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước m&agrave;n h&igrave;nh&nbsp;</strong></td>
			<td>419.9 (H) &times; 540.8 (W) &times; 186.8 (D)</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>2.73 kg</td>
		</tr>
		<tr>
			<td><strong>Cổng kết nối</strong></td>
			<td>1 x HDMI<br />
			1 x VGA</td>
		</tr>
	</tbody>
</table>

<h3><strong>Đ&aacute;nh gi&aacute; chi tiết M&agrave;n h&igrave;nh AOC 24B1XH5 24&quot; IPS 75Hz FHD</strong></h3>

<p>&nbsp;</p>

<p>AOC 24B1XH5 24&quot; IPS 75Hz FHD l&agrave; một trong những d&ograve;ng m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh sở hữu thiết kế mỏng, tối giản nhưng sang trọng, kh&ocirc;ng chỉ gi&uacute;p kh&ocirc;ng gian ph&aacute;t triển &yacute; tưởng của bạn th&ecirc;m tươi mới m&agrave; c&ograve;n tiết kiệm đ&aacute;ng kể cho g&oacute;c l&agrave;m việc của bạn.&nbsp;</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-aoc-24b1xh5-1_efe3c870fb52458e8a444be823067c39_grande.jpg" /></p>

<p>Độ ph&acirc;n giải chuẩn Full HD (1920 x 1080) v&agrave; đ&egrave;n nền LED cho ph&eacute;p bạn dễ d&agrave;ng chia sẻ chế độ xem to&agrave;n cảnh m&agrave; vẫn đảm bảo h&igrave;nh ảnh hiển thị sắc n&eacute;t, rực rỡ như thật. Hỗ trợ tần số qu&eacute;t 75Hz đảm bảo cho khả năng trải nghiệm v&agrave; sử dụng từ c&ocirc;ng việc đến giải tr&iacute; h&agrave;ng&nbsp;ng&agrave;y.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-aoc-24b1xh5-2_02c88a48c3074b8cb0c947e42c34c18a_grande.jpg" /></p>

<p>Tỷ lệ tương phản động l&ecirc;n đến 1000000:1 kh&ocirc;ng những mang lại trải nghiệm thị gi&aacute;c sống động, ch&acirc;n thực vượt trội với g&oacute;c nh&igrave;n si&ecirc;u rộng m&agrave; c&ograve;n gi&uacute;p tiết kiệm lượng điện năng.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-aoc-24b1xh5-3_3558681c75f24058b3633d80c709b9da.jpg" /></p>

<p>M&agrave;n h&igrave;nh LCD AOC 24B1XH5 được trang bị với cổng kết nối HDMI v&agrave; VGA gi&uacute;p cho người d&ugrave;ng c&oacute; thể sử dụng m&agrave;n h&igrave;nh với đa dạng c&aacute;c thiết bị kh&aacute;c nhau như PC, Laptop, C&aacute;c m&aacute;y game Console, c&aacute;c thiết bị đa phương tiện v&agrave; c&aacute;c đầu ph&aacute;t DVD.</p>

<p>&nbsp;</p>
', 100, CAST(N'2022-01-08T23:06:17.053' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1042, N'Màn hình ViewSonic VA2418-SH-2 24“ IPS 75Hz', N'man-hinh-viewsonic-va2418-sh-2-24“-ips-75hz', 3800000, NULL, 2, N'Nhà sản xuất : ViewSonic
Tình trạng : Mới 100%', N'<h2><strong>TH&Ocirc;NG SỐ KĨ THUẬT</strong></h2>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong>Thương hiệu</strong></td>
			<td>ViewSonic</td>
		</tr>
		<tr>
			<td><strong>Bảo h&agrave;nh</strong></td>
			<td>36</td>
		</tr>
		<tr>
			<td><strong>Kích thước</strong></td>
			<td>23.8 inch</td>
		</tr>
		<tr>
			<td><strong>Đ&ocirc;̣ ph&acirc;n giải</strong></td>
			<td>1920 x 1080</td>
		</tr>
		<tr>
			<td><strong>T&acirc;́m n&ecirc;̀n</strong></td>
			<td><a href="https://gearvn.com/collections/man-hinh-24-inch">IPS</a>&nbsp;</td>
		</tr>
		<tr>
			<td><strong>T&acirc;̀n s&ocirc;́ quét</strong></td>
			<td><a href="https://gearvn.com/collections/man-hinh-75hz">75Hz</a>&nbsp;</td>
		</tr>
		<tr>
			<td><strong>Thời gian phản h&ocirc;̀i</strong></td>
			<td>5ms</td>
		</tr>
		<tr>
			<td><strong>Ki&ecirc;̉u màn hình ( phẳng / cong )</strong></td>
			<td>Phẳng</td>
		</tr>
		<tr>
			<td><strong>Đ&ocirc;̣ sáng</strong></td>
			<td>250&nbsp;cd/m2</td>
		</tr>
		<tr>
			<td><strong>Góc nhìn</strong></td>
			<td>178&deg;(H)/178&deg;(V)</td>
		</tr>
		<tr>
			<td><strong>Khả năng hi&ecirc;̉n thị màu sắc</strong></td>
			<td>16.7 triệu m&agrave;u,&nbsp;104% sRGB, NTSC: 72%</td>
		</tr>
		<tr>
			<td><strong>Đ&ocirc;̣ tương phản tĩnh</strong></td>
			<td>1000:1</td>
		</tr>
		<tr>
			<td><strong>C&ocirc;̉ng xu&acirc;́t hình</strong></td>
			<td><strong>VGA:&nbsp;</strong>1<br />
			<strong>3.5mm Audio Out:&nbsp;</strong>1<br />
			<strong>HDMI 1.4:&nbsp;</strong>1<br />
			<strong>Power in:&nbsp;</strong>3-pin Mickey Mouse Socket (IEC C6)</td>
		</tr>
		<tr>
			<td><strong>T&iacute;nh năng đặc biệt</strong></td>
			<td>
			<p><strong>Adaptive Sync:&nbsp;</strong>C&oacute;&nbsp;</p>

			<p><strong>Blue Light Filter:&nbsp;</strong>C&oacute;</p>

			<p><strong>Flicker-Free:&nbsp;</strong>C&oacute;</p>

			<p><a href="https://gearvn.com/blogs/thu-thuat-giai-dap/anti-glare-la-gi"><strong>Anti-Glare</strong></a></p>

			<p><strong>Hard Coating</strong></p>
			</td>
		</tr>
		<tr>
			<td><strong>Kh&ocirc;́i lượng</strong></td>
			<td>3.6 kg</td>
		</tr>
		<tr>
			<td><strong>Ti&ecirc;u thụ điện</strong></td>
			<td>24W</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước chuẩn</strong></td>
			<td>K&iacute;ch thước vật l&yacute; k&egrave;m với kệ(WxHxD): 615 x 398 x 119 mm<br />
			K&iacute;ch thước vật l&yacute; kh&ocirc;ng k&egrave;m kệ(WxHxD): 548 x 404 x 218 mm<br />
			K&iacute;ch thước hộp (WxHxD): 548 x 322 x 38 mm</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết m&agrave;n h&igrave;nh ViewSonic VA2418-SH-2</strong></h2>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>ViewSonic VA2418-SH-2</strong>&nbsp;l&agrave;&nbsp;<a href="https://gearvn.com/collections/man-hinh">m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh</a>&nbsp;c&oacute; k&iacute;ch thước 24&quot;, độ ph&acirc;n giải&nbsp;<a href="https://gearvn.com/collections/do-phan-giai-full-hd-1080p">Full HD</a>&nbsp;v&agrave; sử dụng c&ocirc;ng nghệ&nbsp;tấm nền IPS c&ugrave;ng độ phủ m&agrave;u l&ecirc;n tới 104% sRGB mang đến sự c&acirc;n bằng ho&agrave;n hảo cho trải nghiệm game sống động ở mọi g&oacute;c nh&igrave;n. Sản phẩm t&iacute;ch hợp c&ocirc;ng nghệ&nbsp;Adaptive Sync gi&uacute;p loại bỏ hiện tượng giật h&igrave;nh xảy ra do sự kh&aacute;c biệt giữa tốc độ khung h&igrave;nh của card đồ họa v&agrave; tần số qu&eacute;t của m&agrave;n h&igrave;nh.&nbsp;<a href="https://gearvn.com/collections/man-hinh-tu-5-den-10-trieu">M&agrave;n h&igrave;nh gaming</a>&nbsp;ViewSonic VA2418-sh sở hữu tần số qu&eacute;t 75Hz v&agrave; thời gian phản hồi 5ms gi&uacute;p người d&ugrave;ng c&oacute; những trải nghiệm mượt m&agrave; hơn. VA2418-sh c&ograve;n được trang bị c&ocirc;ng nghệ ViewMode độc quyền&nbsp;cho ph&eacute;p&nbsp;t&ugrave;y chỉnh hoặc&nbsp;k&iacute;ch hoạt ngay c&aacute;c chế độ m&agrave;u được c&agrave;i đặt trước như chơi game, lướt web, xem phim, đọc văn bản..Sản phẩm&nbsp;được t&iacute;ch hợp&nbsp;c&ocirc;ng nghệ bảo vệ mắt tối ưu&nbsp;bao gồm c&ocirc;ng nghệ chống nhấp nh&aacute;y v&agrave; bộ lọc &aacute;nh s&aacute;ng xanh gi&uacute;p bảo vệ game thủ khỏi c&aacute;c hiện tượng đau mỏi mắt, nhức đầu&nbsp;khi ngồi l&acirc;u trước m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh.&nbsp;ViewSonic VA2418-sh được trang bị cổng kết nối HDMI (1.4),&nbsp;<a href="https://gearvn.com/collections/vga-card-man-hinh">VGA</a>&nbsp;gi&uacute;p kết nối dễ d&agrave;ng với PC.</p>

<p style="text-align:center"><img src="https://product.hstatic.net/1000026716/product/gearvn.com-products-man-hinh-viewsonic-va2418-sh-1_9cbfee0ef27d4b77834dc4b05934d518_large.jpg" /></p>

<p>&nbsp;</p>

<h3><strong>C&ocirc;ng nghệ SuperClear&reg; IPS</strong></h3>

<p>Với c&ocirc;ng nghệ SuperClear&reg; IPS, m&agrave;n h&igrave;nh VA2418-sh đem lại h&igrave;nh ảnh ch&acirc;n thực sống động từ mọi g&oacute;c nh&igrave;n.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn.com-products-man-hinh-viewsonic-va2418-sh-9_0e6962b887c640b0908b08d448a780c4_1024x1024.jpg" /></p>

<h3><strong>Bảo vệ đ&ocirc;i mắt của bạn</strong></h3>

<p><a href="https://gearvn.com/collections/man-hinh-viewsonic">M&agrave;n h&igrave;nh ViewSonic</a>&nbsp;t&iacute;ch hợp c&ocirc;ng nghệ Chống nhấp nh&aacute;y v&agrave; Bộ lọc &aacute;nh s&aacute;ng xanh gi&uacute;p bảo vệ đ&ocirc;i mắt của bạn khỏi c&aacute;c hiện tượng mỏi mắt, ch&oacute;ng mặt hay đau đầu khi ngồi l&agrave;m việc l&acirc;u trước m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn.com-products-man-hinh-viewsonic-va2418-sh-10_63a837ca5ced437fb10d70b5bb537f3a_1024x1024.jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h3><strong>Ti&ecirc;u thụ điện năng thấp</strong></h3>

<p>Chế độ tiết kiệm năng lượng của VA2418-sh l&agrave; sự kết hợp việc sử dụng năng lượng hiệu quả v&agrave; tiết kiệm điện năng, đảm bảo hiệu năng l&agrave;m việc v&agrave; tiết kiệm chi ph&iacute; cho bạn.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn.com-products-man-hinh-viewsonic-va2418-sh-11_d252b27c50ac4c5bb7cc5293c6227c7a_1024x1024.jpg" /></p>

<h3><strong>T&iacute;ch hợp sẵn c&aacute;c cấu h&igrave;nh hiển thị m&agrave;u&nbsp;</strong></h3>

<p>ViewSonic&rsquo;s ViewMode bao gồm c&aacute;c c&agrave;i đặt trước &quot;Tr&ograve; chơi&quot;, &quot;Phim&quot;, &quot;Web&quot;, &quot;Văn bản&quot;, &quot;Mono&quot; v&agrave; &quot;Mac&quot; được tối ưu h&oacute;a. Mỗi c&agrave;i đặt trước cung cấp c&aacute;c cải tiến đặc biệt cho đường cong gamma, nhiệt độ m&agrave;u, độ tương phản v&agrave; độ s&aacute;ng để mang lại trải nghiệm xem tối ưu cho c&aacute;c ứng dụng kh&aacute;c nhau.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn.com-products-man-hinh-viewsonic-va2418-sh-12_cb6399f63aa541f3a1a651bcbb1aa60c_1024x1024.jpg" /></p>

<h3><strong>T&iacute;ch hợp c&ocirc;ng nghệ Adaptive Sync</strong></h3>

<p>Thoải m&aacute;i xem video v&agrave; chơi game với c&ocirc;ng nghệ Adaptive Sync gi&uacute;p loại bỏ hiện tượng giật v&agrave;&nbsp;<a href="https://gearvn.com/blogs/thu-thuat-giai-dap/xe-man-hinh-la-gi">x&eacute; m&agrave;n&nbsp;h&igrave;nh</a>.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn.com-products-man-hinh-viewsonic-va2418-sh-13_391a4699bbc34b029ea63799a58a2f49_1024x1024.jpg" /></p>
', 100, CAST(N'2022-01-08T23:12:43.203' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1043, N'Màn hình ViewSonic VA2408-H 24" IPS 75Hz', N'man-hinh-viewsonic-va2408-h-24-ips-75hz', 3850000, NULL, 2, N'Nhà sản xuất: ViewSonic
Tình trạng: Mới 100%', N'<h2><strong>Th&ocirc;ng số sản phẩm :</strong></h2>

<table align="center" border="1" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong>K&iacute;nh thước m&agrave;n h&igrave;nh</strong></td>
			<td>24</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước hiển thị</strong></td>
			<td>23.8</td>
		</tr>
		<tr>
			<td><strong>Tấm nền</strong></td>
			<td>IPS Technology</td>
		</tr>
		<tr>
			<td><strong>Độ ph&acirc;n giải</strong></td>
			<td>1920 x 1080</td>
		</tr>
		<tr>
			<td><strong>Loại ph&acirc;n giải</strong></td>
			<td>FHD</td>
		</tr>
		<tr>
			<td><strong>Tỷ lệ tương phản động</strong></td>
			<td>1,000:1 (typ)</td>
		</tr>
		<tr>
			<td><strong>Tỷ lệ tưởng phản nghịch</strong></td>
			<td>50000000:1</td>
		</tr>
		<tr>
			<td><strong>Nguồn s&aacute;ng</strong></td>
			<td>LED</td>
		</tr>
		<tr>
			<td><strong>Độ s&aacute;ng</strong></td>
			<td>250 cd/m&sup2; (typ)</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u sắc hiển thị</strong></td>
			<td><strong>&nbsp;</strong>16.7 triệu m&agrave;u sắc</td>
		</tr>
		<tr>
			<td><strong>Tỉ lệ khung h&igrave;nh</strong></td>
			<td><strong>&nbsp;</strong>16:9</td>
		</tr>
		<tr>
			<td><strong>Thời gian phản hồi</strong></td>
			<td>4.3ms</td>
		</tr>
		<tr>
			<td><strong>G&oacute;c nh&igrave;n</strong></td>
			<td>178&ordm; ngang, 178&ordm; dọc</td>
		</tr>
		<tr>
			<td><strong>Loại m&agrave;n h&igrave;nh</strong></td>
			<td>Phẳng</td>
		</tr>
		<tr>
			<td><strong>Tần số qu&eacute;t</strong></td>
			<td>75Hz</td>
		</tr>
		<tr>
			<td><strong>Adaptive-Sync (Đồng bộ h&oacute;a th&iacute;ch ứng)</strong></td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td><strong>Bộ lọc &aacute;nh s&aacute;ng xanh</strong></td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td><strong>Kh&ocirc;ng nhấp nh&aacute;y</strong></td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td><strong>Xử l&yacute; bề mặt</strong></td>
			<td>Chống ch&oacute;i</td>
		</tr>
		<tr>
			<td><strong>Năng lượng ti&ecirc;u thụ</strong></td>
			<td>25W (điển h&igrave;nh)<br />
			27W(tối đa)</td>
		</tr>
		<tr>
			<td><strong>Khả năng tương th&iacute;ch</strong></td>
			<td>Độ ph&acirc;n giải PC (tối đa):&nbsp;1920x1080<br />
			Độ ph&acirc;n giải Mac (tối đa):&nbsp;1920x1080<br />
			Hệ điều h&agrave;nh PC:&nbsp;Windows 10 certified; macOS tested<br />
			Độ ph&acirc;n giải Mac (tối thiểu):&nbsp;1920x1080</td>
		</tr>
		<tr>
			<td><strong>Cổng kết nối</strong></td>
			<td>VGA:&nbsp;1<br />
			Đầu ra &acirc;m thanh 3,5 mm:&nbsp;1<br />
			HDMI 1.4:&nbsp;1<br />
			Cổng cắm nguồn:&nbsp;External power adapter</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước (mm)</strong></td>
			<td>Bao b&igrave;:&nbsp;622 x 420 x 144<br />
			K&iacute;ch thước<strong>:&nbsp;</strong>540 x 423 x 189<br />
			K&iacute;ch thước kh&ocirc;ng c&oacute; ch&acirc;n đế:&nbsp;540 x 323 x 51</td>
		</tr>
		<tr>
			<td><strong>Khối lượng (kg)</strong></td>
			<td>Khối lượng tịnh:<strong>&nbsp;</strong>3.4<br />
			Khối lượng tịnh kh&ocirc;ng c&oacute; ch&acirc;n đế:<strong>&nbsp;</strong>3<br />
			Tổng:<strong>&nbsp;</strong>4.8</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết m&agrave;n h&igrave;nh m&agrave;n h&igrave;nh ViewSonic VA2408-H 24&ldquo; IPS 75Hz.</strong></h2>

<p>M&agrave;n h&igrave;nh ViewSonic VA2408-H ch&iacute;nh l&agrave; sự lựa chọn ph&ugrave; hợp cho doanh nghiệp hoặc gia đ&igrave;nh,&nbsp;khi n&oacute; sở hiệu m&agrave;n h&igrave;nh kh&ocirc;ng viền c&oacute; k&iacute;ch thước 24 inch, độ ph&acirc;n giải Full HD với tấm nền IPS, c&oacute; t&iacute;ch hợp c&aacute;c cổng kết nối th&ocirc;ng dụng như HDMI v&agrave; VGA,... ViewSonic VA2408-H cung cấp chất lượng h&igrave;nh ảnh tuyệt đẹp v&agrave; mức ti&ecirc;u thụ điện năng cực kỳ thấp. Ngo&agrave;i ra, m&agrave;n h&igrave;nh c&ograve;n cung cấp 6 chế độ xem đ&atilde; được tối ưu h&oacute;a cho c&aacute;c mục đ&iacute;ch v&agrave; nhu cầu kh&aacute;c nhau của người d&ugrave;ng.</p>

<p style="text-align:center"><img alt="gearvn-màn hình ViewSonic VA2408-H 24“ IPS 75Hz" src="https://file.hstatic.net/1000026716/file/gearvn-man_hinh_viewsonic_va2408-h-1_84072ced8e6c40d886c6d512eb385418.jpg" /></p>

<h3><strong>Chất lượng hiển thị h&igrave;nh ảnh phong ph&uacute;, sống động</strong></h3>

<p>M&agrave;n h&igrave;nh ViewSonic VA2408-H sử dụng tấm nền c&ocirc;ng nghệ SuperClear IPS cho chất lượng h&igrave;nh ảnh tinh tế, ch&acirc;n thật v&agrave; r&otilde; n&eacute;t từ mọi g&oacute;c nh&igrave;n. Cho d&ugrave; bạn đang nh&igrave;n từ tr&ecirc;n cao xuống hay từ dưới l&ecirc;n, từ b&ecirc;n tr&aacute;i hay phải th&igrave; chất lượng h&igrave;nh ảnh vẫn được đảm bảo.</p>

<p>Sở hữu độ ph&acirc;n giải Full HD 1920x1080, ViewSonic VA2408-H cung cấp hiệu suất h&igrave;nh ảnh, đồ họa cực kỳ r&otilde; n&eacute;t. Cho d&ugrave; bạn đang l&agrave;m việc, chơi game hay giải tr&iacute;, bạn vẫn sẽ t&igrave;m được trải nghiệm về h&igrave;nh ảnh hiển thị một c&aacute;ch tuyệt vời.</p>

<p style="text-align:center"><img alt="gearvn-màn hình ViewSonic VA2408-H 24“ IPS 75Hz" src="https://file.hstatic.net/1000026716/file/gearvn-man_hinh_viewsonic_va2408-h-3_8826b5e7690643b8aebc2b1f070aabe8.jpg" /></p>

<p style="text-align:center"><img alt="gearvn-màn hình ViewSonic VA2408-H 24“ IPS 75Hz" src="https://file.hstatic.net/1000026716/file/gearvn-man_hinh_viewsonic_va2408-h-2_497335589a7b4ff7bd42ec59b9a324c2.jpg" /></p>

<h3><strong>T&iacute;ch hợp nhiều c&ocirc;ng nghệ t&acirc;n tiến</strong></h3>

<p>Với c&ocirc;ng nghệ đồng bộ h&oacute;a th&iacute;ch ứng FreeSync &trade;, hiện tượng giật, lag v&agrave; x&eacute; m&agrave;n h&igrave;nh sẽ kh&ocirc;ng xuất hiện tr&ecirc;n m&agrave;n h&igrave;nh của bạn. Thay v&agrave;o đ&oacute;, h&igrave;nh ảnh mang lại sẽ cực kỳ mượt m&agrave;, sắc n&eacute;t v&agrave; liền mạch trong mọi khung h&igrave;nh.</p>

<p>Hơn thế nữa, m&agrave;n h&igrave;nh ViewSonic VA2408-H c&ograve;n được bổ sung c&ocirc;ng nghệ khử nhấp nh&aacute;y m&agrave;n h&igrave;nh v&agrave; bộ lọc &aacute;nh s&aacute;ng xanh - c&ocirc;ng nghệ Eye-Care c&oacute; thể loại bỏ t&igrave;nh trạng mỏi mắt do nh&igrave;n trực tiếp v&agrave;o m&aacute;y t&iacute;nh trong một khoảng thời gian d&agrave;i. Bạn cũng c&oacute; thể thoải m&aacute;i gắn ViewSonic VA2408-H l&ecirc;n tường khi ViewSonic c&oacute; hỗ trợ bộ treo tường VESA đi k&egrave;m khi mua sản phẩm.</p>

<p style="text-align:center"><img alt="gearvn-màn hình ViewSonic VA2408-H 24“ IPS 75Hz" src="https://file.hstatic.net/1000026716/file/gearvn-man_hinh_viewsonic_va2408-h-5_b3b7c84b2ee1468884a175a830d5af8a.jpg" /></p>

<h3><strong>Đa dạng nhiều chế độ cho người d&ugrave;ng</strong></h3>

<p>ViewSonic VA2408-H cung cấp c&aacute;c chế độ người d&ugrave;ng như &quot;Game&quot;, &quot;Movie&quot;, &quot;Web&quot;, &quot;Text&quot; v&agrave; &quot;Mono&quot; đ&atilde; được tối ưu h&oacute;a dựa tr&ecirc;n c&aacute;c mục đ&iacute;ch kh&aacute;c nhau. C&aacute;c c&agrave;i đặt c&oacute; sẵn n&agrave;y gi&uacute;p tăng cường gamma, nhiệt độ m&agrave;u, độ tương phản v&agrave; độ s&aacute;ng để mang đến cho bạn trải nghiệm xem đỉnh cao nhất c&oacute; thể.</p>

<p>Thiết kế của m&agrave;n h&igrave;nh ViewSonic VA2408-H ch&uacute; trọng đến hiệu quả sử dụng năng lượng. Chế độ Eco-Mode ti&ecirc;u thụ &iacute;t năng lượng điện hơn so với mặt bằng chung, gi&uacute;p giảm bớt lượng kh&iacute; thải carbon ra m&ocirc;i trường cũng như l&agrave;m giảm chi ph&iacute; ti&ecirc;u thụ điện.</p>
', 50, CAST(N'2022-01-08T23:14:29.337' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1044, N'Intel Core i3 10100F / 6MB / 4.3GHZ / 4 nhân 8 luồng / LGA 1200', N'intel-core-i3-10100f-6mb-4-3ghz-4-nhan-8-luong-lga-1200', 2190000, NULL, 17, N'Hãng sản xuất: Intel
Bảo hành: 36 Tháng
', N'<h2><strong>Th&ocirc;ng số kỹ thuật:</strong></h2>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong>Thương hiệu:</strong></td>
			<td>Intel</td>
		</tr>
		<tr>
			<td><strong>Thế hệ:</strong></td>
			<td><a href="https://gearvn.com/collections/cpu-10th-gen" title="Core i3 Gen 10th">Core i3 Gen 10th</a></td>
		</tr>
		<tr>
			<td><strong>Socket:</strong></td>
			<td>FCLGA 1200</td>
		</tr>
		<tr>
			<td><strong>Số nh&acirc;n:</strong></td>
			<td>4</td>
		</tr>
		<tr>
			<td><strong>Số luồng:</strong></td>
			<td>8</td>
		</tr>
		<tr>
			<td><strong>Tốc độ cơ bản:</strong></td>
			<td>3.6 GHz</td>
		</tr>
		<tr>
			<td><strong>Cache:</strong></td>
			<td>6MB</td>
		</tr>
		<tr>
			<td><strong>Tiến tr&igrave;nh sản xuất:</strong></td>
			<td>14nm</td>
		</tr>
		<tr>
			<td><strong>Hỗ trợ 64-bit:</strong></td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td><strong>Hỗ trợ Si&ecirc;u ph&acirc;n luồng:</strong></td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td><strong>Hỗ trợ bộ nhớ:</strong></td>
			<td>DDR4 2666 MHz</td>
		</tr>
		<tr>
			<td><strong>Hỗ trợ số k&ecirc;nh bộ nhớ:</strong></td>
			<td>2</td>
		</tr>
		<tr>
			<td><strong>Hỗ trợ c&ocirc;ng nghệ ảo h&oacute;a:</strong></td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td><strong>Tốc độ GPU t&iacute;ch hợp cơ bản:</strong></td>
			<td>350 MHz</td>
		</tr>
		<tr>
			<td><strong>Tốc độ GPU t&iacute;ch hợp tối đa:</strong></td>
			<td>1.15 GHz</td>
		</tr>
		<tr>
			<td><strong>Phi&ecirc;n bản PCI Express:</strong></td>
			<td>3</td>
		</tr>
		<tr>
			<td><strong>Số lane PCI Express:</strong></td>
			<td>16</td>
		</tr>
		<tr>
			<td><strong>TDP:</strong></td>
			<td>65W</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết CPU Intel Core i3-10100F / 6MB / 4.3GHZ / 4 nh&acirc;n 8 luồng</strong></h2>

<p>&nbsp;</p>

<p><strong>CPU Intel Core i3-10100F / 6MB / 4.3GHZ / 4 nh&acirc;n 8 luồng</strong>, chiếc&nbsp;<a href="https://gearvn.com/collections/cpu-10th-gen" title="CPU 10th Gen">CPU 10th Gen</a>&nbsp;mới nhất từ đội xanh Intel. Sở hữ hiệu năng mạnh mẽ c&ugrave;ng mức gi&aacute; hợp l&yacute; từ việc kh&ocirc;ng trang bị GPU t&iacute;ch hợp, i3-10100F trở th&agrave;nh kẻ th&aacute;ch thức với những chiếc CPU gi&aacute; rẻ c&ugrave;ng ph&acirc;n kh&uacute;c hiện nay, đặc biệt l&agrave; CPU AMD&nbsp;<a href="https://gearvn.com/products/amd-ryzen-3-3100-16mb-3-6ghz-4-nhan-8-luong" title="Ryzen 3 3100">Ryzen 3 3100</a>.</p>

<h3><strong>Intel Core i3-10100F sở hữu hiệu năng mạnh mẽ</strong></h3>

<p><strong>Intel Core i3-10100F</strong>&nbsp;sở hữu mức xung nhịp cơ bản 3.6 GHz, turbo boost đạt 4.3 GHz c&ugrave;ng với 4 nh&acirc;n 8 luồng. Với sức mạnh vượt trội c&ugrave;ng c&ocirc;ng nghệ si&ecirc;u ph&acirc;n luồng (Hyper-Threading), i3-10100F thực sự l&agrave; c&uacute; hit lớn trong l&agrave;ng&nbsp;<a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly" title="CPU">CPU</a>. Sức mạnh của i3-10100F c&oacute; thể s&aacute;nh ngang với người tiền nhiệm i7-7700.</p>

<p style="text-align:center"><img alt="GEARVN.COM - CPU Intel Core i3-10100F / 6MB / 4.3GHZ / 4 nhân 8 luồng" src="https://file.hstatic.net/1000026716/file/gearvn-intel-core-i3-10100f-03_f6e7dbe168ec4c0a9fbe7a9fe1ed803a.jpg" /></p>

<h3><strong>Đem lại trải nghiệm gaming tốt nhất</strong></h3>

<p>Sở hữu hiệu năng tuyệt vời, Intel Core&nbsp;<a href="https://gearvn.com/products/core-i3-10100f-6mb-4-3ghz-4-nhan-8-luong" title="i3-10100F">i3-10100F</a>&nbsp;sẽ l&agrave; lựa chọn đ&aacute;ng gi&aacute; d&agrave;nh cho c&aacute;c game thủ khi CPU từ nh&agrave; Intel c&oacute; thể c&acirc;n hầu hết c&aacute;c tựa game hot v&agrave; đ&igrave;nh đ&aacute;m nhất hiện nay như: LOL, FO4, Dota 2, COD:Warzone, &hellip;</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/pc_ivy_-_29-min_a267dcf2e5f848adbc93b2a7686abd4e.jpg" style="height:600px; width:899px" /></p>

<h3><strong>Intel Core i3-10100F - trang bị kh&ocirc;ng thể thiếu trong những chiếc&nbsp;<a href="https://gearvn.com/pages/pc-gvn" title="PC Gaming">PC Gaming</a></strong></h3>

<p>Trang bị socket LGA 1200 đem lại cho Intel Core i3-10100F khả năng tối ưu tr&ecirc;n những chiếc&nbsp;<a href="https://gearvn.com/collections/mainboard-bo-mach-chu" title="mainboard">mainboard</a>&nbsp;tốt nhất hiện nay. Từ ph&acirc;n kh&uacute;c cao cấp cho đến những chiếc&nbsp;<a href="https://gearvn.com/collections/mainboard-bo-mach-chu" title="bo mạch chủ">bo mạch chủ</a>&nbsp;ở ph&acirc;n kh&uacute;c b&igrave;nh d&acirc;n vẫn khai th&aacute;c được tối đa sức mạnh từ chiếc i3-10100F.</p>

<p><img alt="GEARVN.COM - CPU Intel Core i3-10100F / 6MB / 4.3GHZ / 4 nhân 8 luồng" src="https://file.hstatic.net/1000026716/file/gearvn-intel-core-i3-10100f-02_834bbde52e4f4e628d6aa6493dc6a799.jpg" /></p>
', 100, CAST(N'2022-01-08T23:16:36.567' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1045, N'Intel Core i3 10105F / 6MB / 4.4GHZ / 4 nhân 8 luồng / LGA 1200', N'intel-core-i3-10105f-6mb-4-4ghz-4-nhan-8-luong-lga-1200', 2490000, NULL, 17, N'Hãng sản xuất: Intel
Bảo hành: 36 Tháng', N'<h2><strong>Th&ocirc;ng số kỹ thuật</strong></h2>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong>Socket</strong></td>
			<td>FCLGA1200</td>
		</tr>
		<tr>
			<td><strong>D&ograve;ng CPU</strong></td>
			<td>Core i3</td>
		</tr>
		<tr>
			<td><strong>CPU</strong></td>
			<td>Intel&reg; Core&reg; i3-10105F (Comet Lake)</td>
		</tr>
		<tr>
			<td><strong>Số nh&acirc;n</strong></td>
			<td>4</td>
		</tr>
		<tr>
			<td><strong>Số luồng</strong></td>
			<td>8</td>
		</tr>
		<tr>
			<td><strong>Tốc độ xử l&yacute;</strong></td>
			<td>3.70 Ghz</td>
		</tr>
		<tr>
			<td><strong>Tốc độ&nbsp;xử l&yacute; tối đa</strong></td>
			<td>4.40 Ghz</td>
		</tr>
		<tr>
			<td><strong>Điện năng ti&ecirc;u thụ</strong></td>
			<td>65W</td>
		</tr>
		<tr>
			<td><strong>C&ocirc;ng nghệ CPU</strong></td>
			<td>14 nm</td>
		</tr>
		<tr>
			<td><strong>Bộ nhớ đệm</strong></td>
			<td>6 MB Intel&reg; Smart Cache</td>
		</tr>
		<tr>
			<td><strong>Bộ nhớ hỗ trợ tối đa</strong></td>
			<td>128 GB</td>
		</tr>
		<tr>
			<td><strong>Loại bộ nhớ</strong></td>
			<td>DDR4-2666</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết Intel Core i3 10105F / 4 nh&acirc;n 8 luồng / LGA 1200</strong></h2>

<p>CPU Intel Core i3-10105F l&agrave; một trong những bộ vi xử l&yacute; mới thế hệ thứ 10 thuộc d&ograve;ng Comet Lake Refresh. Mang trong m&igrave;nh sức mạnh 4 nh&acirc;n 8 luồng v&agrave; xung nhịp đơn nh&acirc;n l&ecirc;n đến 4.4Ghz, bộ vi xử l&yacute; n&agrave;y v&ocirc; c&ugrave;ng mạnh mẽ d&agrave;nh cho những bộ m&aacute;y thuần gaming tầm trung.</p>

<h3><strong>Đặc tả kỹ thuật ấn tượng</strong></h3>

<p>Th&ocirc;ng số kỹ thuật của bộ vi xử l&yacute; Intel Core i3-10105F tương tự như&nbsp;<a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly">CPU</a>&nbsp;Intel Core i3-10100F tuy nhi&ecirc;n c&oacute; 1 số cải tiến. Chi tiết mẫu i3-10105F n&agrave;y c&oacute; 4 nh&acirc;n 8 luồng, xung nhịp cơ bản 3.7GHz v&agrave; xung đơn nh&acirc;n l&agrave; 4.4Ghz. Mức dung lượng bộ nhớ đệm l&ecirc;n đến 6 MB Intel&reg; Smart Cache. Bộ nhớ tối đa c&oacute; thể hỗ trợ l&agrave; 128GB DDR4-2666, TDP 65W v&agrave; vẫn chạy tr&ecirc;n socket LGA-1200.</p>

<p style="text-align:center"><img alt="Intel Core i3 10105F / 4 nhân 8 luồng / LGA 1200" src="https://file.hstatic.net/1000026716/file/bo-vi-xu-ly-intel-core-i3-10105f-4-nhan-8-luong-lga-1200_8d7883a83a794b719e61f68055cfe48e.jpg" /></p>

<h3><strong>Kh&ocirc;ng c&oacute; nh&acirc;n đồ họa t&iacute;ch hợp</strong></h3>

<p>Với hậu tố &quot;F&quot; trong t&ecirc;n model, mẫu vi xử l&yacute; n&agrave;y kh&ocirc;ng c&oacute; iGPU l&agrave; bởi nh&oacute;m kh&aacute;ch h&agrave;ng chủ yếu m&agrave; n&oacute; hướng tới l&agrave; game thủ. Với c&aacute;c game thủ th&igrave; một chiếc vi xử l&yacute; t&iacute;ch hợp GPU sẽ kh&ocirc;ng đủ đ&aacute;p ứng trải nghiệm chơi game m&agrave; thay v&agrave;o đ&oacute; l&agrave; một chiếc&nbsp;<a href="https://gearvn.com/collections/vga-card-man-hinh">card m&agrave;n h&igrave;nh</a>&nbsp;tương th&iacute;ch v&agrave; chuy&ecirc;n dụng theo nhu cầu của m&igrave;nh.</p>

<p style="text-align:center"><img alt="Intel Core i3 10105F / 4 nhân 8 luồng / LGA 1200" src="https://file.hstatic.net/1000026716/file/bo-vi-xu-ly-intel-core-i3-10105f-4-nhan-8-luong-lga-1200-1_3270c23f21364e33b770072a1e364c5f.jpg" /></p>

<h3><strong>Tương th&iacute;ch với c&aacute;c bo mạch chủ thế hệ cũ</strong></h3>

<p>Với việc c&oacute; thể sử dụng socket LGA-1200 n&ecirc;n bạn ho&agrave;n to&agrave;n c&oacute; thể chạy n&oacute; c&ugrave;ng những bo mạch chủ chipset Intel 400 Series thế hệ cũ cũng như những mẫu bo mạch chủ thế hệ mới 500 Series (trong đ&oacute; nổi bật nhất hiện tại l&agrave;&nbsp;<a href="https://gearvn.com/collections/mainboard-z590">bo mạch chủ Z590</a>).</p>

<h3><strong>C&ocirc;ng nghệ theo d&otilde;i nhiệt</strong></h3>

<p>Tr&aacute;nh việc nhiệt độ qu&aacute; n&oacute;ng l&agrave;m ảnh hưởng xấu đến vi xử l&yacute;, Cảm biến nhiệt kỹ thuật số khi c&oacute; sự cố (DTS)&nbsp; gi&uacute;p ph&aacute;t hiện nhiệt độ của l&otilde;i từ đ&oacute; c&aacute;c t&iacute;nh năng quản l&yacute; nhiệt l&agrave;m giảm ti&ecirc;u thụ điện của g&oacute;i để m&aacute;y lu&ocirc;n hoạt động ổn định, an to&agrave;n v&agrave; tốt nhất.</p>

<h3><strong>C&ocirc;ng nghệ si&ecirc;u ph&acirc;n luồng</strong></h3>

<p>C&ocirc;ng nghệ Intel&reg; HT (Hyper threading) cho ta hai luồng xử l&yacute; tr&ecirc;n mỗi nh&acirc;n vật l&yacute;. Những ứng dụng ph&acirc;n luồng cao sẽ gi&uacute;p m&aacute;y xử l&yacute; được nhiều c&ocirc;ng việc c&ugrave;ng l&uacute;c, từ đ&oacute; ho&agrave;n th&agrave;nh c&ocirc;ng việc nhanh hơn.</p>

<p style="text-align:center"><img alt="Intel Core i3 10105F / 4 nhân 8 luồng / LGA 1200" src="https://file.hstatic.net/1000026716/file/bo-vi-xu-ly-intel-core-i3-10105f-4-nhan-8-luong-lga-1200-2_c4cfd9b8f2c241f9b83d309cfc4c454c.jpg" /></p>

<h3><strong>C&ocirc;ng nghệ Intel Turbo Boost 2.0</strong></h3>

<p>L&agrave;m tăng tần số của bộ xử l&yacute; i3-10105F một c&aacute;ch động khi cần bằng c&aacute;ch khai th&aacute;c khoảng trống nhiệt v&agrave; điện để tăng tốc khi cần v&agrave; n&acirc;ng cao khả năng tiết kiệm điện khi kh&ocirc;ng cần.</p>

<h3><strong>Năng suất tăng cường với Intel Optane</strong></h3>

<p>Bộ vi xử l&yacute; i3 10105F hỗ trợ c&ocirc;ng nghệ Intel Optane tạo ra tốc độ phản hồi tốt hơn khi l&agrave;m việc li&ecirc;n quan đến dữ liệu. Bộ nhớ Intel Optane l&agrave; c&ocirc;ng nghệ th&ocirc;ng minh gi&uacute;p tăng tốc độ phản hồi của m&aacute;y t&iacute;nh.</p>

<h3><strong>Intel Core i3 10105F / 4 nh&acirc;n 8 luồng / LGA 1200 c&oacute; ph&ugrave; hợp với bạn?</strong></h3>

<p>Nếu bạn đang muốn x&acirc;y dựng cho m&igrave;nh một bộ PC tầm trung chất lượng cao, gi&aacute; rẻ th&igrave; Intel Core i3 10105F / 4 nh&acirc;n 8 luồng / LGA 1200 sẽ l&agrave; bộ vi xử l&yacute; d&agrave;nh cho bạn. Mạnh mẽ tương đương với những CPU i7 thế hệ 7 trở về trước v&agrave; kh&ocirc;ng c&oacute; nh&acirc;n đồ họa t&iacute;ch n&ecirc;n nếu bạn sẽ cần trang bị th&ecirc;m cho m&igrave;nh một chiếc card đồ họa. Nếu mong muốn của bạn thỏa m&atilde;n 2 điều tr&ecirc;n th&igrave; đừng ngần ngại đến ngay Gearvn để sở hữu bộ vi xử l&yacute; n&agrave;y.</p>
', 100, CAST(N'2022-01-08T23:23:40.827' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1046, N'Intel Core i7 10700 / 16MB / 4.8GHz / 8 Nhân 16 Luồng / LGA 1200', N'intel-core-i7-10700-16mb-4-8ghz-8-nhan-16-luong-lga-1200', 8390000, NULL, 17, N'Hãng sản xuất: Intel 
Bảo hành: 36 Tháng', N'<h2><u><strong>Th&ocirc;ng số sản phẩm :</strong></u></h2>

<table align="center" border="1" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong>Socket</strong></td>
			<td>FCLGA1200</td>
		</tr>
		<tr>
			<td><strong>D&ograve;ng CPU</strong></td>
			<td>Core i7</td>
		</tr>
		<tr>
			<td><strong>CPU</strong></td>
			<td>Intel&reg; Core&reg; i7-10700 (Comet Lake)</td>
		</tr>
		<tr>
			<td><strong>Số Nh&acirc;n</strong></td>
			<td>8</td>
		</tr>
		<tr>
			<td><strong>Số Luồng</strong></td>
			<td>16</td>
		</tr>
		<tr>
			<td><strong>Tốc độ xử l&yacute;</strong></td>
			<td>2.90 GHz</td>
		</tr>
		<tr>
			<td><strong>Tốc độ xử l&yacute; tối đa</strong></td>
			<td>4.80 GHz</td>
		</tr>
		<tr>
			<td><strong>Điện năng ti&ecirc;u thụ</strong></td>
			<td>65W</td>
		</tr>
		<tr>
			<td><strong>C&ocirc;ng nghệ CPU</strong></td>
			<td>14nm</td>
		</tr>
		<tr>
			<td><strong>Bộ nhớ đệm</strong></td>
			<td>16 MB Intel&reg; Smart Cache</td>
		</tr>
		<tr>
			<td><strong>Bộ nhớ hỗ trợ tối đa</strong></td>
			<td>128 GB</td>
		</tr>
		<tr>
			<td><strong>Loại bộ nhớ</strong></td>
			<td>DDR4-2933</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết&nbsp;Intel Core i7 10700&nbsp;/ 16MB / 2.9GHz / 8 Nh&acirc;n 16 Luồng / LGA 1200</strong></h2>

<p>&nbsp;</p>

<p><strong>CPU Intel Core i7-10700</strong>&nbsp;l&agrave; bộ vi xử l&yacute; mới nhất từ nh&agrave; Intel thuộc d&ograve;ng Comet Lake. Sở hữu những th&ocirc;ng số ấn tượng c&ugrave;ng khả năng &eacute;p xung,&nbsp;<strong>i7-10700</strong>&nbsp;xứng đ&aacute;ng l&agrave; một trong những chiếc CPU Gen 10&nbsp;tốt nhất.</p>

<p><img src="https://file.hstatic.net/1000026716/file/intel-core-i7-10700k-006_b3d86b876a304d8d9baee392f3396cee.jpeg" /></p>

<h3><strong>Th&ocirc;ng số kỹ thuật ấn tượng</strong></h3>

<p><strong>CPU Intel Core i7-10700</strong>&nbsp;được sản xuất dựa tr&ecirc;n tiến tr&igrave;nh 14nm đem lại cho bộ vi xử l&yacute; sức mạnh ấn tượng. Với 8 nh&acirc;n 16 luồng đi k&egrave;m với tần số cơ bản l&agrave; 2.90 GHz v&agrave; turbo boost l&ecirc;n đến 4.80&nbsp;GHz,&nbsp;<strong>i7-10700</strong>&nbsp;đem lại tốc độ xử l&yacute; t&aacute;c vụ v&ocirc; c&ugrave;ng nhanh v&agrave; khả năng hoạt động đa nhiệm mượt m&agrave; khi học tập, l&agrave;m việc v&agrave; giải tr&iacute;.</p>

<p><img src="https://file.hstatic.net/1000026716/file/intel-core-i7-10700k-004_3f4fc7a4d70b4208b3b1a13802059171.jpeg" /><img src="https://file.hstatic.net/1000026716/file/intel-core-i7-10700k-003_ac2abd7964524a9a8f6702149fdfa99f.jpeg" /></p>

<h3><strong>Nh&acirc;n đồ họa t&iacute;ch hợp mạnh mẽ</strong></h3>

<p><strong>Intel Core i7-10700</strong>&nbsp;sở hữu nh&acirc;n đồ họa t&iacute;ch hợp Intel UHD Graphics 630 được thiết kế tr&ecirc;n kiến tr&uacute;c Iris Plus&nbsp;mới nhất. Tần số cơ sở đạt 350 MHz v&agrave; khi turbo đạt 1.20&nbsp;GHz đem lại cho&nbsp;<strong>Intel Core i7-10700</strong>&nbsp;khả năng xử l&yacute; đồ họa th&ocirc;ng minh, đỉnh cao c&ugrave;ng tốc độ nhanh hơn.</p>

<p><img src="https://file.hstatic.net/1000026716/file/intel-core-i7-10700k-005_617ba778a5ea45a6883dd5dde4e6b49e.jpeg" /></p>

<p>&nbsp;</p>

<h3><strong>Tốc độ RAM vượt trội hỗ trợ khả năng &eacute;p xung</strong></h3>

<p>Tốc độ RAM tr&ecirc;n&nbsp;<strong>Intel Core i7-10700</strong>&nbsp;được n&acirc;ng cấp l&ecirc;n 2933&nbsp;MHz v&agrave; c&oacute; khả năng hỗ trợ&nbsp;tr&ecirc;n những mainboard sử dụng chipset 400 series như&nbsp;<a href="https://gearvn.com/collections/mainboard-intel-b560-rocket-lake" title="B560">B460</a>&nbsp;v&agrave;&nbsp;<a href="https://gearvn.com/collections/mainboard-z590" title="Z590">Z490</a>.</p>

<p><img src="https://file.hstatic.net/1000026716/file/intel-core-i7-10700k-002_4794bcd0e4814ddda9e7fe3f748b1c60.jpeg" /></p>

<h3><strong>Wi-Fi 6&nbsp;</strong></h3>

<p>CPU&nbsp;<strong>Intel Core i7-10700</strong>&nbsp;hỗ trợ c&ocirc;ng nghệ Wi-Fi 6 AX201 Intel&reg; được cải thiện hiệu năng kết nối kh&ocirc;ng d&acirc;y (Wi-Fi), giảm độ trễ, tr&aacute;nh t&igrave;nh trạng giật lag v&agrave; c&oacute; độ bảo mật cao nhất.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/intel-core-i7-10700k-001_063f5502ce254f84b0fd4919213f12ce.jpeg" /></p>
', 100, CAST(N'2022-01-08T23:25:27.613' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1047, N'Laptop ASUS D515DA EJ845T', N'laptop-asus-d515da-ej845t', 12990000, NULL, 23, N'Thương hiệu: Asus
Tình trạng: Mới ', N'<h2><strong>Th&ocirc;ng số kĩ thuật:&nbsp;</strong></h2>

<table align="center" border="1" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p><strong>Thương hiệu</strong></p>
			</td>
			<td>
			<p>Asus</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Bảo h&agrave;nh</strong></p>
			</td>
			<td>
			<p>24 th&aacute;ng</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Model</strong></p>
			</td>
			<td>
			<p>ASUS D515DA EJ845T</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>CPU</strong></p>
			</td>
			<td>
			<p>AMD Ryzen 3-3250U,&nbsp;2.6GHz upto 3.5GHz,&nbsp;2 cores&nbsp;4&nbsp;threads</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>RAM</strong></p>
			</td>
			<td>
			<p>4GB DDR4 on board (+ 1 slot So-dimm, up to 20GB SDRAM)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Ổ cứng</strong></p>
			</td>
			<td>
			<p>512GB M.2 NVMe&trade; PCIe&reg; 3.0 SSD (+ 1 slot 2.5 &quot;, up to 2TB)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Card đồ họa</strong></p>
			</td>
			<td>
			<p>AMD Radeon&trade; Graphics</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>M&agrave;n h&igrave;nh</strong></p>
			</td>
			<td>
			<p>15.6-inch, FHD (1920 x 1080) 16:9, TN 200nits, Screen-to-body ratio: 83 ％</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Cổng giao tiếp</strong></p>
			</td>
			<td>
			<p>1x USB 3.2 Gen 1 Type-A<br />
			1x USB 3.2 Gen 1 Type-C<br />
			2x USB 2.0 Type-A<br />
			1x HDMI 1.4<br />
			1x 3.5mm Combo Audio Jack</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>B&agrave;n ph&iacute;m</strong></p>
			</td>
			<td>
			<p>B&agrave;n ph&iacute;m ti&ecirc;u chuẩn&nbsp;</p>

			<p>Bảo mật v&acirc;n tay</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Chu&acirc;̉n LAN</strong></p>
			</td>
			<td>
			<p>Kh&ocirc;ng c&oacute;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Chuẩn WIFI</strong></p>
			</td>
			<td>
			<p>Wi-Fi 5(802.11ac)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Bluetooth</strong></p>
			</td>
			<td>
			<p>Bluetooth 4.2</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Webcam</strong></p>
			</td>
			<td>
			<p>HD 720p</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Hệ điều h&agrave;nh</strong></p>
			</td>
			<td>
			<p>Windows 10 Home</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Pin</strong></p>
			</td>
			<td>
			<p>2-cell, 37WHrs</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Trọng lượng</strong></p>
			</td>
			<td>
			<p>1.80 kg</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>M&agrave;u sắc</strong></p>
			</td>
			<td>
			<p>Bạc</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Kích thước</strong></p>
			</td>
			<td>
			<p>36.00 x 23.50 x 1.99 ~ 1.99 cm</p>
			</td>
		</tr>
	</tbody>
</table>

<h3><strong>Đ&aacute;nh gi&aacute; chi tiết Laptop ASUS D515DA&nbsp;EJ845T</strong></h3>

<p>Laptop Asus D515DA-EJ845T&nbsp;l&agrave; d&ograve;ng sản phẩm laptop với thiết kế mỏng nhẹ vừa&nbsp;được nh&agrave; Asus cho&nbsp;ra mắt c&aacute;ch đ&acirc;y kh&ocirc;ng l&acirc;u&nbsp;đ&atilde; mang&nbsp;đến sự trải nghiệm tiện&nbsp;lợi cho người d&ugrave;ng.</p>

<p><img src="https://file.hstatic.net/1000026716/file/laptop-asus-d515da-ej845t-1_e1f22f763f49462a8f15262d6460dfa1.jpg" /></p>

<h3><strong>Đặc điểm nổi bật</strong></h3>

<p>ASUS D515DA&nbsp;EJ845T thay v&igrave; d&ugrave;ng CPU Intel core i th&igrave; lần n&agrave;y sản phẩm&nbsp;đ&atilde; được nh&agrave; sản xuất trang bị CPU&nbsp;AMD Ryzen 3-3250U (2.6GHz upto 3.5GHz, 4MB) c&ugrave;ng với bộ nhớ trong 4GB RAM cung cấp khả năng&nbsp;hỗ trợ tốt c&aacute;c&nbsp;ứng dụng&nbsp;văn ph&ograve;ng như Word, Excel, PowerPoint. B&ecirc;n cạnh đ&oacute; m&aacute;y c&oacute; thể xử l&iacute; Photoshop với mức đơn giản v&agrave; nhẹ. M&aacute;y c&ograve;n được hỗ trợ ổ cứng SSD&nbsp;512GB mang lại dung lượng kh&aacute; lớn gi&uacute;p người d&ugrave;ng thỏa m&aacute;i lưu trữ dữ liệu m&agrave; kh&ocirc;ng hề lo lắng.&nbsp;Laptop&nbsp;ASUS D515DA EJ845T c&ograve;n được hỗ trợ cảm biến v&acirc;n tay t&iacute;ch hợp tr&ecirc;n b&agrave;n di chuột, vừa bảo mật tốt v&agrave; dễ d&agrave;ng mở m&aacute;y v&agrave; đăng nhập nhanh gọn.&nbsp;</p>

<p><img src="https://file.hstatic.net/1000026716/file/laptop-asus-d515da-ej845t-2_ea594bc482f348e88c318cf9f5102f87.jpg" /></p>

<h3><strong>C&aacute;c cổng kết nối</strong></h3>

<p>Laptop&nbsp;ASUS X415EA EJ845T&nbsp;được trang bị&nbsp;cổng HDMI&nbsp;để người d&ugrave;ng c&oacute; thể kết nối th&ecirc;m 1 m&agrave;n h&igrave;nh&nbsp;nữa cho nhu cầu&nbsp;sử dụng m&aacute;y&nbsp;với 2 m&agrave;n h&igrave;nh,&nbsp;gi&uacute;p cải thiện hiệu suất&nbsp;c&ocirc;ng việc. B&ecirc;n cạnh cổng HDMI ra th&igrave; sản phẩm&nbsp;vẫn c&oacute; đầy đủ c&aacute;c cổng như USB type C, USB type A, cổng sạc v&agrave; cổng đọc thẻ SD. Cổng USB type C bao gồm Thunderbolt để xuất được cả m&agrave;n h&igrave;nh 4K thoải m&aacute;i.</p>

<p>&nbsp;</p>

<p><img src="https://file.hstatic.net/1000026716/file/laptop-asus-d515da-ej845t-4_a31ebca78c014fae86d2e5cabde6c6e6.jpg" /></p>
', 99, CAST(N'2022-01-08T23:27:21.973' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1048, N'Laptop Asus Vivobook X515EP EJ268T', N'laptop-asus-vivobook-x515ep-ej268t', 17590000, NULL, 23, N'Nhà sản xuất: ASUS

Xuất xứ: Chính hãng

Bảo hành: 24 Tháng', N'<h2><strong><strong>Th&ocirc;ng số kỹ thuật:</strong></strong></h2>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td>
			<p><strong>Thương hiệu:</strong></p>
			</td>
			<td>
			<p>Asus</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Bảo h&agrave;nh:</strong></p>
			</td>
			<td>
			<p>24 th&aacute;ng</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Series:</strong></p>
			</td>
			<td>
			<p>Vivobook X515EP EJ006T</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly" target="_blank"><strong>CPU:</strong></a></p>
			</td>
			<td>Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB</td>
		</tr>
		<tr>
			<td>
			<p><a href="https://gearvn.com/collections/ram-pc" target="_blank"><strong>RAM:</strong></a></p>
			</td>
			<td>8GB (4GB x 2) DDR4 2666MHz (1 khe SO-DIMM, n&acirc;ng cấp tối đa 12GB SDRAM)</td>
		</tr>
		<tr>
			<td>
			<p><strong>Ổ lưu trữ:</strong></p>
			</td>
			<td>512GB SSD M.2 PCIE Gen3X4, 1 khe SATA3 2.5&quot;</td>
		</tr>
		<tr>
			<td>
			<p><a href="https://gearvn.com/collections/vga-card-man-hinh" target="_blank"><strong>Card đồ họa:</strong></a></p>
			</td>
			<td>NVIDIA GeForce MX330 2GB GDDR5&nbsp;</td>
		</tr>
		<tr>
			<td>
			<p><strong>M&agrave;n h&igrave;nh:</strong></p>
			</td>
			<td>
			<p>15.6&quot; FullHD (1920 x 1080), chống ch&oacute;i, độ s&aacute;ng&nbsp;200nits, độ phủ m&agrave;u&nbsp;NTSC: 45%,&nbsp;tỉ lệ m&agrave;n h&igrave;nh tr&ecirc;n th&acirc;n m&aacute;y: 83&nbsp;％</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>B&agrave;n ph&iacute;m:</strong></p>
			</td>
			<td>
			<p>Kh&ocirc;ng LED</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Audio:</strong></p>
			</td>
			<td>
			<p>SonicMaster</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Đọc thẻ nhớ:</strong></p>
			</td>
			<td>
			<p>C&oacute; khe đọc thẻ nhớ micro SD</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Kết nối c&oacute; d&acirc;y (LAN):</strong></p>
			</td>
			<td>
			<p>Kh&ocirc;ng</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Kết nối kh&ocirc;ng d&acirc;y:</strong></p>
			</td>
			<td>
			<p>802.11 AC, Bluetooth v4.1</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Webcam:</strong></p>
			</td>
			<td>
			<p>VGA camera</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Cổng giao tiếp:</strong></p>
			</td>
			<td>
			<p>1 x&nbsp;USB 3.2 Gen 1<br />
			1 x USB 3.2 Gen 1 TypeC<br />
			2 x USB 2.0&nbsp;<br />
			1 x HDMI 1.4<br />
			1 x jack audio 3.5mm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Hệ điều h&agrave;nh:</strong></p>
			</td>
			<td>
			<p>Windows 10 Home</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Pin:&nbsp;</strong></p>
			</td>
			<td>
			<p>2 Cell 37Whr</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Trọng lượng:</strong></p>
			</td>
			<td>
			<p>1.8 kg</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>K&iacute;ch thước:</strong></p>
			</td>
			<td>
			<p>36.00 x 23.50 x 1.99 (cm)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>M&agrave;u sắc:</strong></p>
			</td>
			<td>
			<p>Bạc</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Bảo mật:&nbsp;</strong></p>
			</td>
			<td>
			<p>Cảm biến v&acirc;n tay</p>
			</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết&nbsp;Laptop Asus Vivobook X515EP EJ268T</strong></h2>

<h3><strong>Thiết kế hiện đại</strong></h3>

<p>Laptop Asus Vivobook&nbsp;X515EP EJ268T l&agrave; một trong những chiếc&nbsp;<a href="https://gearvn.com/collections/laptop-asus-van-phong-pho-thong" target="_blank">laptop Asus&nbsp;văn ph&ograve;ng phổ th&ocirc;ng</a>&nbsp;mang ki&ecirc;̉u dáng thời thượng và tinh t&ecirc;́, với ch&acirc;́t li&ecirc;̣u vỏ làm từ nh&ocirc;m nguy&ecirc;n kh&ocirc;́i góp ph&acirc;̀n mang lại đ&ocirc;̣ cứng cáp cho chi&ecirc;́c máy. Toàn th&acirc;n laptop được phủ m&ocirc;̣t màu bạc sang trọng với logo ASUS n&ocirc;̉i b&acirc;̣t ở lưng máy.</p>

<p style="text-align:center"><img alt="GEARVN Laptop Asus Vivobook X515EP EJ268T" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-vivobook-x515ep-ej268t-6_ccd388527fd44a56b0d192980da4408f_grande.jpg" /></p>

<h3><strong>M&agrave;n h&igrave;nh chất lượng</strong></h3>

<p>Laptop Asus Vivobook&nbsp;X515EP EJ268T<strong>&nbsp;</strong>sử dụng màn hình kích thước 15.6 inch, đ&ocirc;̣ ph&acirc;n giải Full HD (1920 x 1080 pixels) giúp hình ảnh hi&ecirc;̉n thị rõ nét. Vi&ecirc;̀n màn hình si&ecirc;u mỏng cùng khả năng ch&ocirc;́ng chói sẽ giúp người dùng quan sát hình ảnh d&ecirc;̃ dàng hơn tr&ecirc;n VivoBook 15, đ&ocirc;̀ng thời bảo v&ecirc;̣ mắt hi&ecirc;̣u quả.</p>

<p style="text-align:center"><img alt="GEARVN Laptop Asus Vivobook X515EP EJ268T" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-vivobook-x515ep-ej268t-3_e62738b575ec41ebb0b1c19cf3c14844_grande.jpg" /></p>

<h3><strong>Cấu h&igrave;nh vượt trội</strong></h3>

<p>&nbsp;</p>

<p><a href="https://gearvn.com/collections/laptop-asus-vivobook-series" target="_blank">Laptop Asus Vivobook</a>&nbsp;X515EP EJ268T&nbsp;c&oacute; thể đ&aacute;p ứng tốt cho&nbsp;cả nhu c&acirc;̀u xử lý c&ocirc;ng vi&ecirc;̣c l&acirc;̃n giải trí với những tựa game thỏa thích. Có được y&ecirc;́u t&ocirc;́ này là vì chi&ecirc;́c máy sử dụng b&ocirc;̣ vi xử lý Intel Core i5-1135G7 4 nh&acirc;n 8 lu&ocirc;̀ng k&ecirc;́t hợp cùng card đ&ocirc;̀ họa NVIDIA GeForce MX330 2GB giúp xử lý t&ocirc;́t các c&ocirc;ng vi&ecirc;̣c đa nhi&ecirc;̣m l&acirc;̃n hình ảnh đ&ocirc;̀ họa n&acirc;ng cao. Qua đó VivoBook 15 hoàn toàn đủ sức thực hi&ecirc;̣n c&ocirc;ng vi&ecirc;̣c thi&ecirc;́t k&ecirc;́ đ&ocirc;̀ họa, hay th&acirc;̣m chí là chơi game ở mức setting trung bình cao.</p>

<p style="text-align:center"><img alt="GEARVN Laptop Asus Vivobook X515EP EJ268T" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-vivobook-x515ep-ej268t-4_f63d61daf0f14eb791c4f4cde5305595_grande.jpg" /></p>

<p>Ngoài ra, b&ecirc;n trong&nbsp;Laptop Asus Vivobook&nbsp;X515EP EJ268T còn được trang bị b&ocirc;̣ nhớ RAM 8 GB, kèm theo &ocirc;̉ cứng&nbsp;<a href="https://gearvn.com/collections/ssd-o-cung-the-ran" target="_blank">SSD</a>&nbsp;dung lượng 512 GB PCIe giữ cho c&ocirc;ng su&acirc;́t máy lu&ocirc;n &ocirc;̉n định. Chi&ecirc;́c máy được tích hợp sẵn h&ecirc;̣ đi&ecirc;̀u hành Windows 10 Home, với đ&acirc;̀y đủ phương thức k&ecirc;́t n&ocirc;́i đảm bảo c&ocirc;ng vi&ecirc;̣c lu&ocirc;n di&ecirc;̃n ra su&ocirc;n sẻ cho người d&ugrave;ng.</p>

<h3><strong>B&agrave;n ph&iacute;m tối ưu c&ugrave;ng hệ thống bảo mật hiện đại</strong></h3>

<p>Được sở hữu một b&agrave;n ph&iacute;m số hiện đại c&ugrave;ng với những ph&iacute;m nhấn ti&ecirc;u chuẩn, khoảng c&aacute;ch bố tr&iacute; giữa c&aacute;c ph&iacute;m rất đẹp mắt c&ugrave;ng với gam m&agrave;u x&aacute;m nổi bật gi&uacute;p cho bạn c&oacute; thể l&agrave;m việc trong b&oacute;ng tối những vẫn c&oacute; thể nh&igrave;n r&otilde;. B&ecirc;n cạnh đ&oacute; c&ograve;n được trang bị mở kh&oacute;a bằng cảm biến v&acirc;n tay, chỉ cần chạm nhẹ v&agrave;o v&agrave;o phần b&ecirc;n phải của Touchpad l&agrave; c&oacute; thể mở kh&oacute;a một c&aacute;ch nhanh ch&oacute;ng v&agrave; tiện lợi, kh&ocirc;ng cần d&ugrave;ng đến hệ thống mở truyền thống như nhập mật khẩu.</p>

<p style="text-align:center"><img alt="GEARVN Laptop Asus Vivobook X515EP EJ268T" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-vivobook-x515ep-ej268t-5_8548f7cf50be45dbb13eee4f0f6b0e76_grande.jpg" /></p>

<h3><strong>Sự kết nối đa dạng&nbsp;</strong></h3>

<p>C&aacute;c cổng kết nối được đặt ở 2 b&ecirc;n cạnh vi&ecirc;n của laptop bao gồm 5 cổng kết nối: 1 cổng&nbsp;USB 3.2 Gen 1, 1 cổng USB 3.2 Gen 1 TypeC, 2 cổng&nbsp;USB 2.0, 1 cổng kết nối HDMI 1.4 v&agrave; 1 jack cắm tai nghe&nbsp;audio 3.5mm. Bạn c&oacute; thể kết nối mọi nơi mọi l&uacute;c v&agrave; l&agrave;m nhiều việc c&ugrave;ng l&uacute;c, gi&uacute;p cho c&ocirc;ng việc của bạn trở n&ecirc;n nhanh ch&oacute;ng v&agrave; tiện lợi hơn cả.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="GEARVN Laptop Asus Vivobook X515EP EJ268T" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-vivobook-x515ep-ej268t-2_d745a4e430a3433ea6532696e7b11b94_grande.jpg" /></p>
', 100, CAST(N'2022-01-08T23:29:02.367' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1049, N'Laptop ASUS Vivobook Flip 14 TP470EA EC027T', N'laptop-asus-vivobook-flip-14-tp470ea-ec027t', 14890000, NULL, 23, N'Hãng sản xuất : Asus 
Tình trạng : Mới
Bảo hành : 24 tháng', N'<p><strong>TH&Ocirc;NG SỐ KĨ THUẬT :&nbsp;</strong></p>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td>CPU</td>
			<td>Intel Core i3-1115G4</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>4GB Onboard LPDDR4X&nbsp;</td>
		</tr>
		<tr>
			<td>Ổ cứng</td>
			<td>512GB SSD M.2 PCIE G3X4</td>
		</tr>
		<tr>
			<td>Card đồ họa</td>
			<td>Intel UHD Graphics</td>
		</tr>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>14&quot; FHD (1920 x 1080) IPS, 200nits, NTSC: 45%, Touch Screen</td>
		</tr>
		<tr>
			<td>B&agrave;n ph&iacute;m</td>
			<td>Ti&ecirc;u chuẩn</td>
		</tr>
		<tr>
			<td>Audio</td>
			<td>SonicMaster</td>
		</tr>
		<tr>
			<td>Đọc thẻ nhớ</td>
			<td>Micro SD card reader</td>
		</tr>
		<tr>
			<td>Kết nối c&oacute; d&acirc;y (LAN)</td>
			<td>None</td>
		</tr>
		<tr>
			<td>Kết nối kh&ocirc;ng d&acirc;y</td>
			<td>Wifi 6 (802.11 AX), Bluetooth v5.0</td>
		</tr>
		<tr>
			<td>Webcam</td>
			<td>VGA camera</td>
		</tr>
		<tr>
			<td>Cổng giao tiếp</td>
			<td>1x USB 2.0 Loại A<br />
			1x USB 3.2 Thế hệ 2 Loại A<br />
			1x Thunderbolt&trade; 4 hỗ trợ m&agrave;n h&igrave;nh / power delivery<br />
			1x HDMI 1.4<br />
			1x Giắc &Acirc;m thanh Kết hợp 3,5 mm<br />
			1x DC v&agrave;o<br />
			Đầu đọc thẻ Micro SD</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>Windows 10 Home</td>
		</tr>
		<tr>
			<td>Pin</td>
			<td>3 Cells 42WHrs</td>
		</tr>
		<tr>
			<td>Trọng lượng</td>
			<td>1.5 kg</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>32.40 x 22.00 x 1.87 ~ 1.87 cm</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc</td>
			<td>Silver</td>
		</tr>
		<tr>
			<td>Bảo mật</td>
			<td>V&acirc;n tay</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết laptop ASUS Vivobook Flip 14 TP470EA EC027T</strong></h2>

<h3><strong>Thiết kế sang trọng</strong></h3>

<p>ASUS Vivobook Flip 14 TP470EA EC027T sang trọng v&agrave; thanh lịch với thiết kế si&ecirc;u mỏng 18&nbsp;mm v&agrave; trọng lượng chỉ 1.5kg. Nhờ đ&oacute;, đ&acirc;y l&agrave; bạn đồng h&agrave;nh trong c&ocirc;ng việc đắc lực cho nhu cầu l&agrave;m việc bất cứ nơi đ&acirc;u v&agrave; thường xuy&ecirc;n di chuyển. M&aacute;y cũng được trang bị m&agrave;n h&igrave;nh cảm ứng v&agrave; thiết kế xoay gập 2-trong-1 tiện lợi. Người d&ugrave;ng c&oacute; thể sử dụng n&oacute; như một chiếc laptop hoặc một chiếc m&aacute;y t&iacute;nh bảng. Cấu h&igrave;nh tối ưu để đ&aacute;p ứng hầu hết c&aacute;c nhu cầu sử dụng văn ph&ograve;ng v&agrave; giải tr&iacute; đa phương tiện cho người d&ugrave;ng năng động.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/asus_tp470_product_photo__2s_transparent_silver_09_cb67853322f8403f9c0c5d4492f57099_grande.jpg" /></p>

<h3><strong>Hiệu suất mạnh mẽ cho đa t&aacute;c vụ</strong></h3>

<p>&nbsp;</p>

<p>Với CPU Intel Core i3 thế hệ mới nhất gồm 2 nh&acirc;n 4 luồng xử l&yacute;, TP470EA-EC027T mang lại hiệu suất tối đa cho nhu cầu l&agrave;m việc văn ph&ograve;ng nhưng vẫn tiết kiệm điện. Với card đồ hoạ t&iacute;ch hợp Intel UHD, cả nhu cầu giải tr&iacute; đa phương tiện nhẹ nh&agrave;ng lẫn văn ph&ograve;ng đều được đ&aacute;p ứng tối ưu. Vi xử l&yacute; tiết kiệm năng lượng hứa hẹn mang lại thời lượng pin ấn tượng, đủ để đ&aacute;p ứng cho nhu cầu tối thiểu một buổi học tập hoặc l&agrave;m việc.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/asus_tp470_product_photo__2s_transparent_silver_20_598dbe3afb0743a3896e8d506896fac9_grande.jpg" /></p>

<h3><br />
<strong>Trải nghiệm mới với m&agrave;n h&igrave;nh cảm ứng</strong></h3>

<p>M&agrave;n h&igrave;nh cảm ứng gi&uacute;p người d&ugrave;ng c&oacute; một phương thức kh&aacute;c để tương t&aacute;c với laptop y&ecirc;u qu&yacute;. Với việc hỗ trợ c&ocirc;ng nghệ cảm ứng đa điểm, kh&ocirc;ng chỉ l&agrave; l&agrave;m việc, giờ đ&acirc;y bạn c&oacute; thể chia sẻ, trao đổi th&ocirc;ng tin dễ d&agrave;ng hơn với đồng nghiệp nhờ m&agrave;n h&igrave;nh cảm ứng v&agrave; thiết kế xoay gập như m&aacute;y t&iacute;nh bảng. Ngo&agrave;i ra, đ&acirc;y cũng l&agrave; phương tiện giải tr&iacute; hữu hiệu với kho ứng dụng v&agrave; games giải tr&iacute; đa dạng từ Microsoft Store.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/icon_badge_opt2_cf31f15b4ff54879b539d6612a02ac47_grande.jpg" /></p>

<h3><br />
<strong>Kết nối kh&ocirc;ng d&acirc;y si&ecirc;u tốc</strong></h3>

<p>C&ocirc;ng nghệ WiFi 6 (802.11AX) l&agrave; c&ocirc;ng nghệ WiFi nhanh nhất đang được thương mại ho&aacute; hiện nay. Kết nối WiFi 6 mang lại băng th&ocirc;ng l&ecirc;n đến 10Gbps v&agrave; nhanh hơn nhiều lần so với c&aacute;c chuẩn WiFi 5 đang được phổ biến hiện nay. Nhờ đ&oacute;, người d&ugrave;ng c&oacute; thể tận hưởng nhu cầu sử dụng đa t&aacute;c vụ sử dụng internet một c&aacute;ch thoải m&aacute;i m&agrave; kh&ocirc;ng lo c&oacute; vấn đề nghẽn xảy ra. Kết nối WiFi 6 cũng sẽ hỗ trợ đa người d&ugrave;ng tr&ecirc;n c&ugrave;ng một điểm ph&aacute;t s&oacute;ng tốt hơn, từ đ&oacute; giảm thiểu c&aacute;c vấn đề rớt mạng hoặc giật lag khi sử dụng.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/asus_tp470_product_photo__2s_transparent_silver_12_9c5eaf101d9a4b0ab40335d8cac6d0b1_grande.jpg" /></p>
', 100, CAST(N'2022-01-08T23:30:22.640' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1050, N'Laptop Acer Aspire 3 A315 58 3939', N'laptop-acer-aspire-3-a315-58-3939', 11590000, NULL, 23, N'Nhà sản xuất : ACER

Xuất xứ : Chính hãng', N'<p><strong>Th&ocirc;ng số kỹ thuật</strong></p>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td>CPU</td>
			<td>Intel Core i3-1115G4&nbsp;upto 4.10 GHz,&nbsp;2 cores&nbsp;4&nbsp;threads</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>4GB DDR4 2400MHz&nbsp;Onboard&nbsp;(1x onboard 4GB +&nbsp;1x SO-DIMM socket, up to 12GB SDRAM)</td>
		</tr>
		<tr>
			<td>&Ocirc;̉ cứng</td>
			<td>256GB SSD M.2 PCIE, 1x slot SATA3 2.5&quot;</td>
		</tr>
		<tr>
			<td>Card đồ họa</td>
			<td>Intel UHD Graphics</td>
		</tr>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>15.6&quot; FHD (1920 x 1080) Acer ComfyView LCD, Anti-Glare</td>
		</tr>
		<tr>
			<td>Cổng giao tiếp</td>
			<td>1x USB 3.1, 2x USB 2.0, HDMI, RJ-45</td>
		</tr>
		<tr>
			<td>Ổ quang</td>
			<td>None</td>
		</tr>
		<tr>
			<td>Audio</td>
			<td>Realtek High Definition</td>
		</tr>
		<tr>
			<td>Đọc thẻ nhớ</td>
			<td>None</td>
		</tr>
		<tr>
			<td>Chu&acirc;̉n LAN</td>
			<td>10/100/1000 Mbps</td>
		</tr>
		<tr>
			<td>Chuẩn WIFI</td>
			<td>802.11 ac</td>
		</tr>
		<tr>
			<td>Bluetooth</td>
			<td>v4.2</td>
		</tr>
		<tr>
			<td>Webcam</td>
			<td>HD Webcam</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>Windows 10 Home</td>
		</tr>
		<tr>
			<td>Pin</td>
			<td>3 Cell 36.7 Whr</td>
		</tr>
		<tr>
			<td>Trọng lượng</td>
			<td>1.7 kg</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc</td>
			<td>Shale Black</td>
		</tr>
		<tr>
			<td>Kích thước</td>
			<td>363 x 247.5 x 19.9 (mm)</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết laptop Acer Aspire 3 A315 58 3939</strong></h2>

<p>Trang bị bộ vi xử l&yacute; Intel thế hệ thứ 10 Ice Lake mới nhất, ổ cứng SSD si&ecirc;u tốc v&agrave; m&agrave;n h&igrave;nh Full HD tuyệt đẹp,&nbsp;<strong>Acer Aspire 3 A315 58 3939</strong>&nbsp;l&agrave; chiếc laptop đ&aacute;p ứng tốt c&ocirc;ng việc v&agrave; giải tr&iacute; của bạn trong tầm gi&aacute; hấp dẫn.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-acer-aspire3-a315583939-1_7862026d0cfb4e7eb5521b19240ca5af_grande.jpg" /></p>

<h3><strong>Mạnh mẽ hơn với bộ vi xử l&yacute; mới v&agrave; ổ cứng SSD</strong></h3>

<p><strong>Acer Aspire 3 A315 58 3939</strong>&nbsp;được trang bị bộ vi xử l&yacute; Intel Core i3&nbsp;1115G4, con chip mới nhất thuộc thế hệ thứ 11&nbsp;Tiger Lake, sản xuất tr&ecirc;n tiến tr&igrave;nh 10nm, vừa mạnh mẽ lại vừa tiết kiệm điện năng. Đi c&ugrave;ng với bộ vi xử l&yacute; mới l&agrave; 4GB RAM DDR4 v&agrave; đặc biệt l&agrave; 256GB ổ cứng SSD.&nbsp;</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-acer-aspire3-a315583939-2_ca485779ad56498c8e351ba8e8ae6bfb_grande.png" /></p>

<p>Việc sử dụng ổ cứng SSD cao cấp thay v&igrave; ổ HDD cũ l&agrave; một bước tiến tuyệt vời của&nbsp;<strong>Aspire 3 A315 58 3939</strong>. Ổ SSD mang đến rất nhiều lợi &iacute;ch khi gi&uacute;p laptop khởi động, v&agrave;o ứng dụng v&agrave; sao ch&eacute;p dữ liệu cực nhanh. Chưa hết, độ bền tuổi thọ SSD c&ograve;n l&acirc;u hơn rất nhiều so với HDD truyền thống, đồng thời hoạt động hết sức &ecirc;m &aacute;i.</p>

<h3><strong>M&agrave;n h&igrave;nh lớn 15.6 inch Full HD viền mỏng hấp dẫn</strong></h3>

<p>M&agrave;n h&igrave;nh 15.6 inch viền si&ecirc;u mỏng của&nbsp;<strong>Acer Aspire 3 A315 58 3939</strong>&nbsp;mang đến chất lượng hiển thị tuyệt vời nhờ độ ph&acirc;n giải Full HD sắc n&eacute;t, cho trải nghiệm hấp dẫn d&ugrave; l&agrave; bạn l&agrave;m việc hay xem phim, chơi game.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-acer-aspire3-a315583939-3_acd40a4d5a3e4234bc5fc5d58b18fbd1_grande.png" /></p>

<p>Kh&ocirc;ng chỉ hiển thị đẹp, m&agrave;n h&igrave;nh n&agrave;y c&ograve;n trang bị phần mềm ngăn chặn &aacute;nh s&aacute;ng xanh Bluelight Shield, bảo vệ thị gi&aacute;c người d&ugrave;ng trong suốt thời gian d&agrave;i sử dụng. Bạn sẽ tr&aacute;nh khỏi những nguy cơ như mỏi mắt, kh&oacute; ngủ d&ugrave; sử dụng m&aacute;y t&iacute;nh nhiều.</p>

<h3><strong>Sử dụng thoải m&aacute;i cả ng&agrave;y m&agrave; kh&ocirc;ng cần đến nguồn sạc</strong></h3>

<p><strong>Acer Aspire 3 A315 58 3939</strong>&nbsp;c&oacute; thời lượng pin l&ecirc;n đến 9 tiếng, con số rất ấn tượng cho một chiếc laptop thiết kế theo phong c&aacute;ch mỏng nhẹ.&nbsp;<strong>Acer Aspire 3 A315 58 3939</strong>&nbsp;đủ để bạn sử dụng trọn một ng&agrave;y l&agrave;m việc văn ph&ograve;ng m&agrave; kh&ocirc;ng cần phải sạc điện.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-acer-aspire3-a315583939-6_fe7a654cef104e5fb59067cecbee79bd_grande.png" /></p>
', 100, CAST(N'2022-01-08T23:32:13.767' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1051, N'Laptop Acer Swift 3 Evo SF314 511 59LV', N'laptop-acer-swift-3-evo-sf314-511-59lv', 20990000, NULL, 23, N'Nhà sản xuất : Acer
Xuất xứ : Chính hãng', N'<h2><strong>Th&ocirc;ng số sản phẩm :</strong></h2>

<table align="center" border="1" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td>
			<p><strong>CPU</strong></p>
			</td>
			<td>
			<p>Intel&reg; Core&trade; i5-1135G7 4&nbsp; Nh&acirc;n 8 Luồng, xung cơ bản 2.40 GHz tối đa&nbsp;4.20 GHz,&nbsp;8 MB Smart Cache</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>RAM</strong></p>
			</td>
			<td>
			<p>16GB LPDDR4X_16GB&nbsp;2666 MHz (Onboard)&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>&Ocirc;̉ cứng</strong></p>
			</td>
			<td>
			<p>512GB PCIe NVMe SSD (C&oacute; thể th&aacute;o ra, lắp thanh kh&aacute;c tối đa 1TB, PCIE Gen3)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Card đồ họa</strong></p>
			</td>
			<td>
			<p>Intel Iris Xe Graphics</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>M&agrave;n h&igrave;nh</strong></p>
			</td>
			<td>
			<p>14&quot;Full HD (1920 x 1080) 60Hz, Tấm nền IPS</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Cổng giao tiếp</strong></p>
			</td>
			<td>
			<p>1 Thunderbolt, 4 USB-C2 x USB 3.2,HDMI,Jack tai nghe 3.5 mm,&nbsp;720p FaceTime HD camera</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Audio</strong></p>
			</td>
			<td>
			<p>Acer TrueHarmony DTS Audio</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Chuẩn WIFI</strong></p>
			</td>
			<td>
			<p>Wi-Fi 6 (802.11ax)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Bluetooth</strong></p>
			</td>
			<td>
			<p>Bluetooth 5.1</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Hệ điều h&agrave;nh</strong></p>
			</td>
			<td>
			<p>Windows 10 Home Bản Quyền</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Pin</strong></p>
			</td>
			<td>
			<p>48 Wh Li-ion</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Trọng lượng</strong></p>
			</td>
			<td>
			<p>1.19 kg</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>M&agrave;u sắc</strong></p>
			</td>
			<td>
			<p>Bạc</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Kích thước</strong></p>
			</td>
			<td>
			<p>D&agrave;i 322.8 mm - Rộng 212.2 mm - D&agrave;y 15.9 mm</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<h2><strong>Đ&aacute;nh gi&aacute;&nbsp;Laptop Acer Swift 3 Evo SF314 511 59LV</strong></h2>

<p><strong>Laptop Acer Swift 3 Evo SF314 511 59LV&nbsp;</strong>l&agrave; một sự&nbsp;lựa chọn h&agrave;ng đầu cho người d&ugrave;ng ph&acirc;n kh&uacute;c Laptop Phổ Th&ocirc;ng -&nbsp;Học Tập - Văn Ph&ograve;ng, mang thiết kế gọn nhẹ, sang trọng c&ugrave;ng hiệu năng vượt trội từ vi xử l&yacute; Intel thế hệ 11 t&acirc;n tiến.</p>

<h3><strong>Thiết kế mỏng nhẹ, ph&ugrave; hợp với mọi đối tượng người d&ugrave;ng</strong></h3>

<p><strong>Laptop Acer Swift 3 Evo SF314 511 59LV</strong>&nbsp;thu h&uacute;t mọi &aacute;nh nh&igrave;n với chiếc &aacute;o m&agrave;u bạc v&agrave; lớp vỏ bằng kim loại nguy&ecirc;n khối gi&uacute;p m&aacute;y trở n&ecirc;n bền bỉ v&agrave; cứng c&aacute;p nhưng vẫn kh&ocirc;ng k&eacute;m phần tinh tế sang trọng. Với độ d&agrave;y chỉ vỏn vẹn 15.9 mm v&agrave; trọng lượng nhẹ 1.19 kg, Acer Swift cho ph&eacute;p người d&ugrave;ng di chuyển m&aacute;y linh hoạt ở khắp mọi nơi.</p>

<p><img src="https://file.hstatic.net/1000026716/file/laptop-acer-swift-3-sf314-511-56g1-04_373e5f18b0a7427fa9d438ba249dddb4.jpeg" /></p>

<h3><strong>Tầm nh&igrave;n r&otilde; v&agrave; s&aacute;ng hơn</strong></h3>

<p>Kh&ocirc;ng gian l&agrave;m việc rộng r&atilde;i hơn d&ugrave; tr&ecirc;n một chiếc laptop nhỏ gọn với thiết kế m&agrave;n h&igrave;nh&nbsp;hai viền si&ecirc;u mỏng v&agrave; tỷ lệ m&agrave;n h&igrave;nh so với th&acirc;n m&aacute;y ấn tượng 88.2%, bạn sẽ c&oacute; được g&oacute;c l&agrave;m việc rộng hơn c&ugrave;ng m&agrave;n h&igrave;nh với độ s&aacute;ng l&ecirc;n đến 300 nits.</p>

<p><img src="https://file.hstatic.net/1000026716/file/laptop-acer-swift-3-sf314-511-56g1-05_84601ce9bb1343e4b16fa510c6376722.jpeg" /></p>

<h3><strong>Năng lượng cho cả ng&agrave;y d&agrave;i</strong></h3>

<p>Di chuyển cả ng&agrave;y y&ecirc;u cầu laptop phải&nbsp; c&oacute; thời lượng pin lớn v&agrave; ở mức 56Wh,&nbsp;<strong>Laptop Acer Swift 3 Evo SF314 511 59LV&nbsp;</strong>c&oacute; khả năng k&eacute;o d&agrave;i đến 17 giờ. Trong trường hợp khẩn cấp, Swift 3 c&oacute; thể sạc nhanh trong 30 ph&uacute;t l&agrave; c&oacute; ngay 4 giờ sử dụng li&ecirc;n tục.</p>

<p><img src="https://file.hstatic.net/1000026716/file/laptop-acer-swift-3-sf314-511-56g1-03_c20adf5e68dd42b692b81ce4f5804eba.jpeg" /></p>

<h3><strong>Truy cập th&ocirc;ng minh</strong></h3>

<p><strong>Laptop Acer Swift 3 Evo SF314 511 59LV</strong>&nbsp;cho ph&eacute;p bạn truy cập nhanh hơn v&agrave; an to&agrave;n hơn m&agrave; kh&ocirc;ng cần phải sử dụng mật khẩu. Nhờ Cortana, Swift 3 cũng c&oacute; thể&nbsp; d&ugrave;ng như một trợ l&yacute; th&ocirc;ng minh để trả lời c&aacute;c c&acirc;u hỏi của bạn.</p>

<p><img src="https://file.hstatic.net/1000026716/file/laptop-acer-swift-3-sf314-511-56g1-06_b1ccaf5a15d64ad7be53003194dbde59.jpeg" /></p>
', 99, CAST(N'2022-01-08T23:33:28.193' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1052, N'Laptop Acer Aspire 5 A514 54 59QK', N'laptop-acer-aspire-5-a514-54-59qk', 17090000, NULL, 23, N'Nhà sản xuất : Acer
Xuất xứ : Chính hãng', N'<h2><strong><strong>TH&Ocirc;NG SỐ KĨ THUẬT</strong></strong></h2>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly">CPU</a></strong></td>
			<td>Intel Core i5-1135G7</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/ram-pc">RAM</a></strong></td>
			<td>8GB DDR4 3200MHz ( 4 Onboard + 4GB 1 thanh RAM)&nbsp;</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/ssd-o-cung-the-ran">&Ocirc;̉ cứng</a></strong></td>
			<td>512GB SSD M.2 PCIE, 1x slot SATA3 2.5&quot;</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/vga-card-man-hinh">Card đồ họa</a></strong></td>
			<td>Intel&reg; Iris&reg; Xe Graphics</td>
		</tr>
		<tr>
			<td><strong><a href="https://gearvn.com/collections/man-hinh">M&agrave;n h&igrave;nh</a></strong></td>
			<td>14&quot; FHD (1920 x 1080) IPS, Acer ComfyView LCD</td>
		</tr>
		<tr>
			<td><strong>Cổng giao tiếp</strong></td>
			<td>
			<p>1x USB 3.2 port with power-off charging<br />
			2x USB 3.2 port<br />
			1x USB Type-C port<br />
			1x RJ-45 port<br />
			1x HDMI&reg; port</p>
			</td>
		</tr>
		<tr>
			<td><strong>Audio</strong></td>
			<td>Acer TrueHarmony technology</td>
		</tr>
		<tr>
			<td><strong>B&agrave;n ph&iacute;m</strong></td>
			<td>Backlit KB</td>
		</tr>
		<tr>
			<td><strong>Đọc thẻ nhớ</strong></td>
			<td>None</td>
		</tr>
		<tr>
			<td><strong>Chuẩn Lan</strong></td>
			<td>Gigabit Ethernet</td>
		</tr>
		<tr>
			<td><strong>Chuẩn WIFI</strong></td>
			<td>Wi-Fi 6 (2x2)</td>
		</tr>
		<tr>
			<td><strong>Bluetooth</strong></td>
			<td>v5.1</td>
		</tr>
		<tr>
			<td><strong>Webcam</strong></td>
			<td>HD Camera</td>
		</tr>
		<tr>
			<td><strong>Hệ điều h&agrave;nh</strong></td>
			<td>Windows 11 Home</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u sắc</strong></td>
			<td>Safari Gold</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết :&nbsp;</strong></h2>

<h3><strong>Thiết kế mỏng đẹp</strong></h3>

<p>Thiết kế trẻ trung, thanh lịch với chất liệu kim loại sang trọng v&agrave; nhều sự lựa chọn m&agrave;u sắc c&aacute; t&iacute;nh hơn. Aspire 5 đạt trọng lượng nhẹ chỉ 1.46kg v&agrave; mỏng 17.95mm.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="Laptop Acer Aspire 5 A514 54 59QK" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-aspire-5-a514-54-59qk-1_2cb6ef29ee964a8eafeefccdb5343f08.jpg" /></p>

<p>&nbsp;</p>

<h3><strong>M&agrave;n h&igrave;nh tr&agrave;n viền theo xu hướng, cạnh mỏng 6.3mm.</strong></h3>

<p style="text-align:center"><img alt="Laptop Acer Aspire 5 A514 54 59QK" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-aspire-5-a514-54-59qk-2_cc9f73ca633c4fd796e6f1b3d214366b.png" /></p>

<h3><strong>Hiệu năng mạnh mẽ</strong></h3>

<p>Được trang bị vi xử l&yacute; Intel Core thế hệ thứ 11 mới nhất, mang lại cho Aspire 5 sức mạnh xử l&yacute; vượt trội hơn. Lưu trữ thấp nhất 256 GB SSD đến cao nhất 1 TB SSD l&agrave; trang bị ti&ecirc;u chuẩn tr&ecirc;n Aspire 5, đảm bảo mọi t&aacute;c vụ được xử l&yacute; nhanh ch&oacute;ng hơn ổ HDD truyền thống.</p>

<p style="text-align:center"><img alt="Laptop Acer Aspire 5 A514 54 59QK" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-aspire-5-a514-54-59qk-3_9f967a4ad05943508ae593ecc15122a5.png" /></p>

<p><br />
Với phi&ecirc;n bản cấu h&igrave;nh c&oacute; khả năng n&acirc;ng cấp tối đa l&ecirc;n đến 20GB RAM, card m&agrave;n h&igrave;nh rời mới nhất Intel UHD Graphics thế hệ 11, việc chơi c&aacute;c game kh&ocirc;ng đ&ograve;i hỏi cao về cấu h&igrave;nh hay sử dụng c&aacute;c phần mềm thiết kế căn bản, render video đơn giản sẽ kh&ocirc;ng l&agrave;m kh&oacute; được Aspire 5.</p>

<h3><strong>H&igrave;nh ảnh sắc n&eacute;t</strong></h3>

<p>Aspire 5 t&iacute;ch hợp tấm nền FullHD IPS cho g&oacute;c nh&igrave;n kh&ocirc;ng giới hạn, m&agrave;u sắc hiển thị ch&acirc;n thật, sống động trong c&aacute;c m&ocirc;i trường &aacute;nh s&aacute;ng kh&aacute;c nhau. Hổ trợ đ&egrave;n b&agrave;n ph&iacute;m gi&uacute;p người d&ugrave;ng sử dụng trong điều kiện thiếu s&aacute;ng.</p>

<p style="text-align:center"><img alt="Laptop Acer Aspire 5 A514 54 59QK" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-aspire-5-a514-54-59qk-4_f9bb3a6bb18b4a16a6b855ca5a7de44c.png" /></p>

<h3><strong>Chất liệu bền bỉ</strong></h3>

<p>C&oacute; thể n&oacute;i Aspire 5 l&agrave; sự lựa chọn số một d&agrave;nh cho những bạn thường &ldquo;x&agrave;i hao&rdquo; đồ c&ocirc;ng nghệ trong thời gian ngắn. Với thiết kế vỏ nh&ocirc;m cứng c&aacute;p, cấu tr&uacute;c chắc chắn từ bản lề, b&agrave;n r&ecirc; cho đến b&agrave;n ph&iacute;m, Acer Aspire 5 c&oacute; khả năng chịu va đập rất tốt cũng như tần suất l&agrave;m việc cao.</p>

<p style="text-align:center"><img alt="Laptop Acer Aspire 5 A514 54 59QK" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-aspire-5-a514-54-59qk-5_48c86a3169454f25b88ca4853d03b693.png" /></p>

<p>&nbsp;</p>

<h3><strong>Thời lượng pin cả ng&agrave;y</strong></h3>

<p>Thời lượng pin của Aspire 5 c&oacute; thể sử dụng từ 7 -11 giờ li&ecirc;n tục trong ng&agrave;y cho những hoạt động c&ocirc;ng sở thường nhật như vừa xử l&yacute; c&ocirc;ng việc vừa thưởng thức &acirc;m nhạc, để m&aacute;y nghỉ trong chế độ Sleep từ 50 đến 70 ph&uacute;t.</p>

<p style="text-align:center"><img alt="Laptop Acer Aspire 5 A514 54 59QK" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-aspire-5-a514-54-59qk-7_61406f59c40f4914995406c36b9fdba7.png" /></p>

<h3><strong>Cổng kết nối đa dạng</strong></h3>

<p>Acer Aspire 5 c&oacute; đầy đủ c&aacute;c cổng kết nối phổ biến gồm cổng USB Type-C, 2 cổng USB 3.1, cổng USB 2.0, cổng HDMI, cổng &acirc;m thanh 3.5 mm (hỗ trợ tai nghe c&oacute; microphone t&iacute;ch hợp), cổng nguồn, đặc biệt l&agrave; Bluetooth 5.0 v&agrave; Wi-Fi 6 tốc độ cao. Điểm kh&aacute;c biệt ấn tượng của chiếc laptop mỏng nhẹ n&agrave;y ch&iacute;nh l&agrave; sở hữu cổng Ethernet ( LAN) c&oacute; khả năng truyền tải nhanh dữ liệu cỡ lớn, thường chỉ c&oacute; tr&ecirc;n những d&ograve;ng m&aacute;y nặng v&agrave; d&agrave;y.</p>

<p><strong>&nbsp;</strong></p>

<p style="text-align:center"><img alt="Laptop Acer Aspire 5 A514 54 59QK" src="https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-aspire-5-a514-54-59qk-8_7ca69ec3360949108d1331500f7d8679.png" /></p>
', 99, CAST(N'2022-01-08T23:34:48.503' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1053, N'(4GB DDR4 1x4GB 2666) RAM Laptop Lexar 4GB 2666 SODIMM', N'-4gb-ddr4-1x4gb-2666-ram-laptop-lexar-4gb-2666-sodimm', 590000, NULL, 1, N'Thương hiệu: Lexar
Chủng loại: RAM Laptop DDR4', N'<p><strong>Th&ocirc;ng số kỹ thuật</strong></p>

<p>&nbsp;</p>

<table border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong>Nh&agrave; sản xuất</strong></td>
			<td>Lexar</td>
		</tr>
		<tr>
			<td><strong>Model</strong></td>
			<td>Lexar<sup>&reg;</sup>&nbsp;DDR4-2666 SODIMM Laptop</td>
		</tr>
		<tr>
			<td><strong>Interface</strong></td>
			<td>260 pin</td>
		</tr>
		<tr>
			<td><strong>Chuẩn Ram</strong></td>
			<td>DDR4</td>
		</tr>
		<tr>
			<td><strong>Bus hỗ trợ</strong></td>
			<td>2666MHz</td>
		</tr>
		<tr>
			<td><strong>Dung lượng</strong></td>
			<td>4GB</td>
		</tr>
		<tr>
			<td><strong>Tương th&iacute;ch</strong></td>
			<td>Laptop</td>
		</tr>
		<tr>
			<td><strong>CAS Latency</strong></td>
			<td>CL19</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết RAM Laptop Lexar 4GB 2666 SODIMM</strong></h2>

<p>&nbsp;</p>

<p><img src="https://file.hstatic.net/1000026716/file/gearvn-ram-laptop-lexar-3_55d670cd280444a28a78afb5fbe773cd_grande.jpg" /></p>

<h3><strong>C&aacute;ch đơn giản để tăng hiệu suất m&aacute;y t&iacute;nh của bạn</strong></h3>

<p>&nbsp;</p>

<p>Bộ nhớ m&aacute;y t&iacute;nh x&aacute;ch tay Lexar DDR4 - 2666 SODIMM cho ph&eacute;p bạn đ&aacute;nh thức PC của m&igrave;nh bằng bản n&acirc;ng cấp hiệu suất gi&uacute;p bạn khởi động nhanh hơn, tăng khả năng phản hồi v&agrave; thời gian tải ứng dụng nhanh hơn. Với c&agrave;i đặt đơn giản, bạn sẽ thiết lập v&agrave; chạy nhanh ch&oacute;ng, v&igrave; vậy bạn c&oacute; thể thực hiện đa nhiệm một c&aacute;ch dễ d&agrave;ng.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-ram-laptop-lexar-4_4c0d7cc6505042c0b63b68179f9d04e2_grande.jpg" /></p>

<h3><strong>Thực hiện bước tiếp theo để đạt được hiệu suất t&iacute;nh to&aacute;n cao</strong></h3>

<p>Mở nhiều ứng dụng c&ugrave;ng l&uacute;c c&oacute; thể l&agrave;m giảm hiệu suất m&aacute;y t&iacute;nh của bạn. Bằng c&aacute;ch c&agrave;i đặt Bộ nhớ m&aacute;y t&iacute;nh x&aacute;ch tay Lexar DDR4-2666 SODIMM, bạn c&oacute; thể tiếp tục chạy đa nhiệm m&agrave; kh&ocirc;ng gặp phải hiện tượng chậm m&aacute;y kh&ocirc;ng cần thiết.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-ram-laptop-lexar-5_2ecfbe4dba064d14add0736f1fe9d689_grande.jpg" /></p>

<h3><strong>Kh&ocirc;ng c&oacute; chỗ trong ng&agrave;y của bạn cho sự chậm trễ</strong></h3>

<p>&nbsp;</p>

<p>C&aacute;c ứng dụng sử dụng nhiều dữ liệu kh&ocirc;ng bao giờ được l&agrave;m chậm hiệu suất của bạn. V&igrave; vậy, cho d&ugrave; bạn duyệt internet, l&agrave;m việc tr&ecirc;n bảng t&iacute;nh hay tải ảnh l&ecirc;n, Lexar DDR4 đều mang đến cho bạn hiệu suất tăng l&ecirc;n để thực hiện đa nhiệm một c&aacute;ch dễ d&agrave;ng.</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-ram-laptop-lexar-6_8f7cb47189794cd1adb611e75fe5cb0c_grande.jpg" /></p>

<h3><strong>Lắp đặt đơn giản</strong></h3>

<p>Với c&aacute;c bước&nbsp;để c&agrave;i đặt Lexar DDR4, bạn sẽ nhanh ch&oacute;ng được tăng hiệu suất m&aacute;y t&iacute;nh của m&igrave;nh.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-ram-laptop-lexar-7_43d098131c474879ae95a66adca5fa9b_grande.jpg" /></p>
', 99, CAST(N'2022-01-08T23:37:13.970' AS DateTime), N'admin', NULL, 1, NULL)
INSERT [dbo].[Product] ([ProductID], [ProductName], [MetaTitle], [Price], [PromotionPrice], [CategoryID], [Description], [Detail], [Quanlity], [ModifiedDate], [ModifiedBy], [ProductTag], [Status], [UnsignName]) VALUES (1054, N'(8GB DDR4 1x8G 3200) RAM Laptop Kingston 8GB SODIMM', N'-8gb-ddr4-1x8g-3200-ram-laptop-kingston-8gb-sodimm', 890000, NULL, 1, N'Thương hiệu: Kingston
Chủng loại: RAM DDR4 Laptop (SODIMM)', N'<p><strong>Th&ocirc;ng số kỹ thuật</strong></p>

<table align="center" border="1" cellpadding="3" cellspacing="0" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><strong>H&atilde;ng sản xuất</strong></td>
			<td>Kington</td>
		</tr>
		<tr>
			<td><strong>Model</strong></td>
			<td>KVR32S22S8/8</td>
		</tr>
		<tr>
			<td><strong>Loại Ram</strong></td>
			<td>DDR4</td>
		</tr>
		<tr>
			<td><strong>Dung lượng</strong></td>
			<td>8GB</td>
		</tr>
		<tr>
			<td><strong>Bus</strong></td>
			<td>3200Mhz</td>
		</tr>
		<tr>
			<td><strong>Độ trễ</strong></td>
			<td>CL22</td>
		</tr>
		<tr>
			<td><strong>Điện &aacute;p</strong></td>
			<td>1.2V</td>
		</tr>
	</tbody>
</table>

<h2><strong>Đ&aacute;nh gi&aacute; chi tiết&nbsp;RAM Kingston Sodimm 1.2V 8GB 3200MHz CL22</strong></h2>

<p>&nbsp;</p>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-ram-laptop-kingston-ddr4-8gb-cl22-bus-3200-sodimm-1_930f85c835e541f8848a4600132948fc_grande.jpeg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h3><strong>Dung lượng 8GB v&agrave; tốc độ xử l&iacute; tốt v&agrave; tiết kiệm năng lượng</strong></h3>

<p>Vấn đề về bộ nhớ lu&ocirc;n l&agrave; điều được rất nhiều người laptop quan t&acirc;m v&agrave; đ&ocirc;i khi phải đau đầu do m&aacute;y kh&ocirc;ng đủ dung lượng cho nhu cầu sử dụng. Khi đ&oacute;, rất nhiều người nghĩ đến biện ph&aacute;p trang bị th&ecirc;m bộ nhớ RAM cho laptop của m&igrave;nh v&agrave; thanh&nbsp;RAM&nbsp;Kingston Sodimm 1.2V 8GB 3200MHz CL22&nbsp;l&agrave; một linh kiện laptop tuyệt vời nhờ v&agrave;o dung lượng cao v&agrave; khả năng xử l&iacute; tốt.</p>

<h3><strong>Đến từ thương hiệu Kingston nổi tiếng c&ugrave;ng dung lượng l&ecirc;n đến 8GB</strong></h3>

<p>Thanh RAM Kingston Sodimm 1.2V 8GB 3200MHz l&agrave; sản phẩm của tập đo&agrave;n Kingston Technology đến từ Mỹ. Đ&acirc;y l&agrave; tập đo&agrave;n được th&agrave;nh lập từ năm 1987 l&agrave; thương hiệu sản xuất bộ nhớ h&agrave;ng đầu thế giới, chiếm hơn 50% thị phần v&agrave; l&agrave; thương hiệu được y&ecirc;u th&iacute;ch v&agrave; tin d&ugrave;ng tại Ch&acirc;u &Aacute; &ndash; Th&aacute;i B&igrave;nh Dương.</p>

<p>Thanh RAM Kingston Sodimm 1.2V 8GB 3200MHz c&oacute; dung lượng l&ecirc;n đến 8GB, đ&acirc;y l&agrave; con số ph&ugrave; hợp cho những ai c&oacute; nhu cầu n&acirc;ng cấp dung lượng cho laptop của m&igrave;nh, ho&agrave;n to&agrave;n đủ khả năng để bạn c&oacute; thể tải th&ecirc;m nhiều phần mềm &ldquo;nặng đ&ocirc;&rdquo; để sử dụng v&agrave; lưu trữ được nhiều dữ liệu hơn.</p>

<h3><strong>Chuẩn Ram DDR4 cho tốc độ xử l&iacute; tốt hơn c&ugrave;ng khả năng n&acirc;ng cấp dễ d&agrave;ng</strong></h3>

<p style="text-align:center"><img src="https://file.hstatic.net/1000026716/file/gearvn-ram-laptop-kingston-ddr4-8gb-cl22-bus-3200-sodimm-2_2443bb923a9f4b83a98f15ab2b3cf137_grande.jpeg" /></p>

<p>Thanh RAM Kingston Sodimm 1.2V 8GB 3200MHz c&oacute; chuẩn RAM DDR4 nhanh gấp nhiều lần so với DDR3 gi&uacute;p m&aacute;y bạn khi xử l&iacute; đa nhiệm được mượt m&agrave; hơn, khả năng xử l&iacute; ổn định v&agrave; khi lướt web sẽ kh&ocirc;ng c&ograve;n gặp t&igrave;nh trạng thiếu RAM.</p>

<p>Kh&ocirc;ng chỉ thế, thanh Kingston Sodimm 1.2V 8GB 3200MHz rất dễ d&agrave;ng để trang bị cho m&aacute;y m&agrave; kh&ocirc;ng cần phải điều chỉnh cấu h&igrave;nh g&igrave; của m&aacute;y gi&uacute;p bạn tiết kiệm nhiều thời gian hơn.</p>

<h3><strong>Xung bus cực cao l&ecirc;n đến 3200 MHz c&ugrave;ng khả năng tiết kiệm năng lượng</strong></h3>

<p>Thanh RAM Kingston Sodimm 1.2V 8GB 3200MHz c&oacute; xung bus l&ecirc;n đến 3200 MHz, với mức xung bus n&agrave;y m&aacute;y bạn sẽ xử l&iacute; được lưu lượng dữ liệu lơn hơn với thời gian nhanh hơn. Xung bus c&agrave;ng cao th&igrave; m&aacute;y t&iacute;nh của bạn sẽ c&agrave;ng xử l&iacute; được mức lưu lượng dữ liệu cao hơn.</p>

<p>Ngo&agrave;i ra, thanh RAM Kingston Sodimm sử dụng hiệu điện thế 1.2V gi&uacute;p tiết kiệm 20% năng lượng so với DDR3 v&agrave; tiết kiệm l&ecirc;n đến 40% tổng năng lượng ti&ecirc;u thụ gi&uacute;p pin m&aacute;y t&iacute;nh bạn sẽ giũ được tuổi thọ tốt hơn rất nhiều.</p>
', 100, CAST(N'2022-01-08T23:39:12.367' AS DateTime), N'admin', NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [MenuID], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'RAM - Bộ nhớ tạm', N'ram-bo-nho-tam', 3, CAST(N'2021-10-11T00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [MenuID], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Màn hình 24 Inch', N'man-hinh-24-inch', 5, CAST(N'2121-10-11T00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [MenuID], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Mainboard - Bo mạch chủ', N'mainboard-bo-mach-chu', NULL, CAST(N'2021-10-17T18:19:20.600' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [MenuID], [ModifiedDate], [ModifiedBy], [Status]) VALUES (17, N'CPU', N'cpu', 3, CAST(N'2021-10-18T01:44:49.537' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [MenuID], [ModifiedDate], [ModifiedBy], [Status]) VALUES (18, N'GPU - Card đồ họa', N'gpu-card-do-hoa', 3, CAST(N'2021-10-19T21:08:28.383' AS DateTime), N'admin', 1)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [MetaTitle], [MenuID], [ModifiedDate], [ModifiedBy], [Status]) VALUES (23, N'Laptop văn phòng', N'laptop-van-phong', 2, CAST(N'2021-10-21T16:04:31.133' AS DateTime), N'admin', 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1064, N'd91dbf41-ac45-4252-a473-0b26b30d7fef_.png', N'~/Images/Products/', 1036)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1065, N'490d46b0-c2c7-4602-bf1e-7db45b0a9c5f_.png', N'~/Images/Products/', 1036)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1066, N'9a3113cd-9f3b-49ed-ada0-de07e300f6ff_.png', N'~/Images/Products/', 1037)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1067, N'27982e6e-49e7-46dc-8fc1-a1a04ca281ef_.png', N'~/Images/Products/', 1038)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1068, N'e51e6e4f-43c5-405d-8001-da9216081667_.png', N'~/Images/Products/', 1038)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1069, N'2ceba9d7-c535-4fb4-bc5a-6969bf6a5db5_.png', N'~/Images/Products/', 1039)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1070, N'1d222160-17b3-4530-8b62-5847d2e06636_.jpg', N'~/Images/Products/', 1040)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1071, N'2783329d-c3ec-4435-85b5-34e869f1e81c_.jpg', N'~/Images/Products/', 1040)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1074, N'93a2f180-aa8e-460c-88dd-ceb3010a0829_.jpg', N'~/Images/Products/', 1041)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1075, N'695759ce-3fb2-4dbf-8b03-09e51041a2e4_.jpg', N'~/Images/Products/', 1042)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1076, N'f3c1ef34-7aad-4044-974f-b68a5e07b7f0_.jpg', N'~/Images/Products/', 1042)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1077, N'1645d64c-2f11-4ed8-9125-7143b0956704_.jpg', N'~/Images/Products/', 1043)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1078, N'642808df-c836-48b4-b527-11f9cb135c05_.jpg', N'~/Images/Products/', 1044)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1079, N'09192d81-8dc2-47ed-abbd-e0a17777df29_.jpg', N'~/Images/Products/', 1045)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1080, N'9a52cec3-d5d1-44af-8a21-039859e3fb9c_.jpg', N'~/Images/Products/', 1046)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1081, N'e466f73a-a50a-4e1c-983f-cd1b537d45a2_.jpg', N'~/Images/Products/', 1047)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1082, N'16941e0c-c4e1-4544-8112-01991a2f9692_.jpg', N'~/Images/Products/', 1047)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1083, N'27555e25-c418-439c-a440-ed4e064d51d9_.jpg', N'~/Images/Products/', 1048)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1084, N'd88848e9-7258-484e-b50f-15d6a1bc5c30_.jpg', N'~/Images/Products/', 1048)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1085, N'f578fca8-fdbb-4c1d-bdc5-7440870bd3a8_.jpg', N'~/Images/Products/', 1049)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1086, N'8110704f-2029-4363-8e79-40bd974fe1ef_.jpg', N'~/Images/Products/', 1049)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1087, N'772b0ad8-454c-4550-a6dd-8cc672125655_.png', N'~/Images/Products/', 1050)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1088, N'55512c3c-7600-429d-9263-e6efe4233bab_.jpg', N'~/Images/Products/', 1050)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1089, N'80d887ff-5e8a-4a75-9e4b-0c8c097fa6fe_.jpg', N'~/Images/Products/', 1051)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1090, N'f31f4402-5f2a-4c8d-a30d-c837d688641f_.jpg', N'~/Images/Products/', 1052)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1091, N'54ed5ac1-eb93-4cf8-b76a-57ee41d3543f_.png', N'~/Images/Products/', 1053)
INSERT [dbo].[ProductImage] ([ImageID], [ImageName], [ImagePath], [ProductID]) VALUES (1092, N'92081785-a58e-4d03-a9ae-9ea7268ae8c3_.jpg', N'~/Images/Products/', 1054)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductOrder] ON 

INSERT [dbo].[ProductOrder] ([OrderID], [FullName], [Address], [PhoneNumber], [TotalPrice], [PaymentMethod], [OrderDate], [CustomerID], [Status]) VALUES (21, N'Nguyễn Anh Vy', N'19, Nguyễn Hữu Thọ, Tân Phong, Quận 7, TP.HCM', N'0842181444 ', 21580000, N'cod       ', CAST(N'2022-01-08T23:42:33.403' AS DateTime), 1, 1)
INSERT [dbo].[ProductOrder] ([OrderID], [FullName], [Address], [PhoneNumber], [TotalPrice], [PaymentMethod], [OrderDate], [CustomerID], [Status]) VALUES (22, N'Nguyễn Anh Vy', N'52, La Thành Thân, Châu Phú B, TP. Châu Đốc, An Giang', N'0842181444 ', 20990000, N'cod       ', CAST(N'2022-01-09T11:19:54.793' AS DateTime), 4, 0)
INSERT [dbo].[ProductOrder] ([OrderID], [FullName], [Address], [PhoneNumber], [TotalPrice], [PaymentMethod], [OrderDate], [CustomerID], [Status]) VALUES (23, N'Nguyễn Anh Vy', N'52, La Thành Thân, Châu Phú B, TP. Châu Đốc, An Giang', N'0842181444 ', 12990000, N'cod       ', CAST(N'2022-01-09T11:27:57.157' AS DateTime), 1, -1)
INSERT [dbo].[ProductOrder] ([OrderID], [FullName], [Address], [PhoneNumber], [TotalPrice], [PaymentMethod], [OrderDate], [CustomerID], [Status]) VALUES (24, N'Nguyễn Anh Vy', N'52, La Thành Thân, Châu Phú B, TP. Châu Đốc, An Giang', N'0842181444 ', 1770000, N'cod       ', CAST(N'2022-01-09T11:30:54.230' AS DateTime), 1, 0)
INSERT [dbo].[ProductOrder] ([OrderID], [FullName], [Address], [PhoneNumber], [TotalPrice], [PaymentMethod], [OrderDate], [CustomerID], [Status]) VALUES (25, N'Nguyễn Anh Vy', N'52, La Thành Thân, Châu Phú B, TP. Châu Đốc, An Giang', N'0842181444 ', 6990000, N'cod       ', CAST(N'2022-01-09T11:31:45.913' AS DateTime), 1, 2)
INSERT [dbo].[ProductOrder] ([OrderID], [FullName], [Address], [PhoneNumber], [TotalPrice], [PaymentMethod], [OrderDate], [CustomerID], [Status]) VALUES (26, N'Nguyễn Anh Vy', N'52, La Thành Thân, Châu Phú B, TP. Châu Đốc, An Giang', N'0842181444 ', 3500000, N'cod       ', CAST(N'2022-01-09T11:34:07.093' AS DateTime), 1, 2)
INSERT [dbo].[ProductOrder] ([OrderID], [FullName], [Address], [PhoneNumber], [TotalPrice], [PaymentMethod], [OrderDate], [CustomerID], [Status]) VALUES (27, N'Phạm Thị Tuyết Quyên', N'Lô 2 ô 15, đường T1, Phước Long, Nha Trang, Khánh Hòa', N'0868138640 ', 17590000, N'cod       ', CAST(N'2022-01-09T11:35:28.163' AS DateTime), 1, 0)
INSERT [dbo].[ProductOrder] ([OrderID], [FullName], [Address], [PhoneNumber], [TotalPrice], [PaymentMethod], [OrderDate], [CustomerID], [Status]) VALUES (28, N'Phạm Thị Tuyết Quyên', N'Lô 2 ô 15, đường T1, Phước Long, Nha Trang, Khánh Hòa', N'0868138640 ', 17090000, N'cod       ', CAST(N'2022-01-09T11:38:57.710' AS DateTime), 4, 1)
SET IDENTITY_INSERT [dbo].[ProductOrder] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[ProductOrder] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([MenuID])
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductOrder]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
USE [master]
GO
ALTER DATABASE [GearShop] SET  READ_WRITE 
GO
