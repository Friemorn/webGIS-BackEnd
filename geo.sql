PGDMP     1    :            	    x            geo    9.6.19    9.6.19      �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16393    geo    DATABASE     �   CREATE DATABASE geo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Indonesia.1252' LC_CTYPE = 'English_Indonesia.1252';
    DROP DATABASE geo;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                        3079    16394    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    4            �           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    2            �            1259    17374    line    TABLE     �   CREATE TABLE public.line (
    id_line integer NOT NULL,
    nama_line character varying(64),
    geom public.geometry(LineString,4326),
    deskripsi character varying(128)
);
    DROP TABLE public.line;
       public         postgres    false    2    2    4    2    4    2    4    4    2    4    2    4    2    4    2    4    4            �            1259    17372    line_id_line_seq    SEQUENCE     y   CREATE SEQUENCE public.line_id_line_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.line_id_line_seq;
       public       postgres    false    4    194            �           0    0    line_id_line_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.line_id_line_seq OWNED BY public.line.id_line;
            public       postgres    false    193            �            1259    17385    point    TABLE     �   CREATE TABLE public.point (
    id_point integer NOT NULL,
    nama_point character varying(64),
    geom public.geometry(Point,4326)
);
    DROP TABLE public.point;
       public         postgres    false    2    2    4    2    4    2    4    4    2    4    2    4    2    4    2    4    4            �            1259    17383    point_id_point_seq    SEQUENCE     {   CREATE SEQUENCE public.point_id_point_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.point_id_point_seq;
       public       postgres    false    196    4            �           0    0    point_id_point_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.point_id_point_seq OWNED BY public.point.id_point;
            public       postgres    false    195            �            1259    17351    polygon    TABLE     �   CREATE TABLE public.polygon (
    id_polygon integer NOT NULL,
    nama_polygon character varying(64),
    geom public.geometry(Polygon,4326),
    deskripsi character varying(128)
);
    DROP TABLE public.polygon;
       public         postgres    false    4    2    2    4    2    4    2    4    4    2    4    2    4    2    4    2    4            �            1259    17349    polygon_id_polygon_seq    SEQUENCE        CREATE SEQUENCE public.polygon_id_polygon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.polygon_id_polygon_seq;
       public       postgres    false    192    4            �           0    0    polygon_id_polygon_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.polygon_id_polygon_seq OWNED BY public.polygon.id_polygon;
            public       postgres    false    191                       2604    17377    line id_line    DEFAULT     l   ALTER TABLE ONLY public.line ALTER COLUMN id_line SET DEFAULT nextval('public.line_id_line_seq'::regclass);
 ;   ALTER TABLE public.line ALTER COLUMN id_line DROP DEFAULT;
       public       postgres    false    194    193    194                       2604    17388    point id_point    DEFAULT     p   ALTER TABLE ONLY public.point ALTER COLUMN id_point SET DEFAULT nextval('public.point_id_point_seq'::regclass);
 =   ALTER TABLE public.point ALTER COLUMN id_point DROP DEFAULT;
       public       postgres    false    196    195    196                       2604    17354    polygon id_polygon    DEFAULT     x   ALTER TABLE ONLY public.polygon ALTER COLUMN id_polygon SET DEFAULT nextval('public.polygon_id_polygon_seq'::regclass);
 A   ALTER TABLE public.polygon ALTER COLUMN id_polygon DROP DEFAULT;
       public       postgres    false    191    192    192            �          0    17374    line 
   TABLE DATA               C   COPY public.line (id_line, nama_line, geom, deskripsi) FROM stdin;
    public       postgres    false    194   �       �           0    0    line_id_line_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.line_id_line_seq', 2, true);
            public       postgres    false    193            �          0    17385    point 
   TABLE DATA               ;   COPY public.point (id_point, nama_point, geom) FROM stdin;
    public       postgres    false    196   �        �           0    0    point_id_point_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.point_id_point_seq', 5, true);
            public       postgres    false    195            �          0    17351    polygon 
   TABLE DATA               L   COPY public.polygon (id_polygon, nama_polygon, geom, deskripsi) FROM stdin;
    public       postgres    false    192   ;!       �           0    0    polygon_id_polygon_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.polygon_id_polygon_seq', 4, true);
            public       postgres    false    191            	          0    16699    spatial_ref_sys 
   TABLE DATA               X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       postgres    false    187   U"                  2606    17382    line line_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.line
    ADD CONSTRAINT line_pkey PRIMARY KEY (id_line);
 8   ALTER TABLE ONLY public.line DROP CONSTRAINT line_pkey;
       public         postgres    false    194    194                       2606    17393    point point_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.point
    ADD CONSTRAINT point_pkey PRIMARY KEY (id_point);
 :   ALTER TABLE ONLY public.point DROP CONSTRAINT point_pkey;
       public         postgres    false    196    196                       2606    17359    polygon polygon_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.polygon
    ADD CONSTRAINT polygon_pkey PRIMARY KEY (id_polygon);
 >   ALTER TABLE ONLY public.polygon DROP CONSTRAINT polygon_pkey;
       public         postgres    false    192    192            �   ~   x�3��J�I�SpO-JJ�KWH�-MI�40402 #W3Cܠ������������������������(��71�0tut33tr����N,*I�Q��K��K-�L�2���ѣ��b���� ½?T      �   �   x�mν� �<O�\
�H)D��.Dk4ZH�3����c�Y�����x�i3!�����RG�����̀͝S�+�LX�Z\:Ǵ�����XVBDd��{�}��h@��cj� ��ʪ\�R��6�&��gC��F%@(���(4^D�ל���5�      �   
  x����J�0 �s�} ��f�w����'�^�,��Bw}Ӧ�\��K���7Ǐqʝ�N�s���%z�
a�� ���d�9���:y�C�DE��{���� A���L_�'���P*��`R�̔t"'#l.=��A�d�JZ���������k����8/�܊�e�����t�s4gg����'�iםa�n�g��Lə��JP�g�z�I�������.^�����������y���y��}��>�ݷm��;��      	      x������ � �     