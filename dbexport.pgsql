PGDMP         /        	        w            crackdetection    9.6.11    9.6.11 �    	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            	           1262    18706    crackdetection    DATABASE     �   CREATE DATABASE crackdetection WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE crackdetection;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12393    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    18738 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         crackdetectionuser    false    3            �            1259    18736    auth_group_id_seq    SEQUENCE     z   CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       crackdetectionuser    false    192    3            	           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       crackdetectionuser    false    191            �            1259    18748    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         crackdetectionuser    false    3            �            1259    18746    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       crackdetectionuser    false    3    194            	           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       crackdetectionuser    false    193            �            1259    18730    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         crackdetectionuser    false    3            �            1259    18728    auth_permission_id_seq    SEQUENCE        CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       crackdetectionuser    false    190    3             	           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       crackdetectionuser    false    189            �            1259    18756 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         crackdetectionuser    false    3            �            1259    18766    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         crackdetectionuser    false    3            �            1259    18764    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       crackdetectionuser    false    198    3            !	           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       crackdetectionuser    false    197            �            1259    18754    auth_user_id_seq    SEQUENCE     y   CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       crackdetectionuser    false    3    196            "	           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       crackdetectionuser    false    195            �            1259    18774    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         crackdetectionuser    false    3            �            1259    18772 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       crackdetectionuser    false    200    3            #	           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       crackdetectionuser    false    199            �            1259    18834    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         crackdetectionuser    false    3            �            1259    18832    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       crackdetectionuser    false    3    202            $	           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       crackdetectionuser    false    201            �            1259    18720    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         crackdetectionuser    false    3            �            1259    18718    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       crackdetectionuser    false    188    3            %	           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       crackdetectionuser    false    187            �            1259    18709    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         crackdetectionuser    false    3            �            1259    18707    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       crackdetectionuser    false    3    186            &	           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       crackdetectionuser    false    185            �            1259    18969    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         crackdetectionuser    false    3            �            1259    18885    main_dataset    TABLE     �   CREATE TABLE public.main_dataset (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(30) NOT NULL
);
     DROP TABLE public.main_dataset;
       public         crackdetectionuser    false    3            �            1259    18883    main_dataset_id_seq    SEQUENCE     |   CREATE SEQUENCE public.main_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.main_dataset_id_seq;
       public       crackdetectionuser    false    206    3            '	           0    0    main_dataset_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.main_dataset_id_seq OWNED BY public.main_dataset.id;
            public       crackdetectionuser    false    205            �            1259    18893    main_datasetimage    TABLE     �   CREATE TABLE public.main_datasetimage (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    image_id integer NOT NULL
);
 %   DROP TABLE public.main_datasetimage;
       public         crackdetectionuser    false    3            �            1259    18891    main_datasetimage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_datasetimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.main_datasetimage_id_seq;
       public       crackdetectionuser    false    208    3            (	           0    0    main_datasetimage_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.main_datasetimage_id_seq OWNED BY public.main_datasetimage.id;
            public       crackdetectionuser    false    207            �            1259    18872 
   main_image    TABLE     �   CREATE TABLE public.main_image (
    id integer NOT NULL,
    data character varying(100) NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE public.main_image;
       public         crackdetectionuser    false    3            �            1259    18870    main_image_id_seq    SEQUENCE     z   CREATE SEQUENCE public.main_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.main_image_id_seq;
       public       crackdetectionuser    false    3    204            )	           0    0    main_image_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.main_image_id_seq OWNED BY public.main_image.id;
            public       crackdetectionuser    false    203            �            1259    18913    main_output    TABLE     �   CREATE TABLE public.main_output (
    id integer NOT NULL,
    algorithm character varying(30) NOT NULL,
    data character varying(100),
    image_id integer NOT NULL
);
    DROP TABLE public.main_output;
       public         crackdetectionuser    false    3            �            1259    18911    main_output_id_seq    SEQUENCE     {   CREATE SEQUENCE public.main_output_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.main_output_id_seq;
       public       crackdetectionuser    false    210    3            *	           0    0    main_output_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.main_output_id_seq OWNED BY public.main_output.id;
            public       crackdetectionuser    false    209            �            1259    18957    main_product    TABLE     �   CREATE TABLE public.main_product (
    id integer NOT NULL,
    title character varying(30) NOT NULL,
    data character varying(100),
    output_id integer NOT NULL
);
     DROP TABLE public.main_product;
       public         crackdetectionuser    false    3            �            1259    18955    main_product_id_seq    SEQUENCE     |   CREATE SEQUENCE public.main_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.main_product_id_seq;
       public       crackdetectionuser    false    212    3            +	           0    0    main_product_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.main_product_id_seq OWNED BY public.main_product.id;
            public       crackdetectionuser    false    211            .           2604    18741    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    191    192    192            /           2604    18751    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    193    194    194            -           2604    18733    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    190    189    190            0           2604    18759    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    195    196    196            1           2604    18769    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    198    197    198            2           2604    18777    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    200    199    200            3           2604    18837    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    202    201    202            ,           2604    18723    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    187    188    188            +           2604    18712    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    185    186    186            6           2604    18888    main_dataset id    DEFAULT     r   ALTER TABLE ONLY public.main_dataset ALTER COLUMN id SET DEFAULT nextval('public.main_dataset_id_seq'::regclass);
 >   ALTER TABLE public.main_dataset ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    205    206    206            7           2604    18896    main_datasetimage id    DEFAULT     |   ALTER TABLE ONLY public.main_datasetimage ALTER COLUMN id SET DEFAULT nextval('public.main_datasetimage_id_seq'::regclass);
 C   ALTER TABLE public.main_datasetimage ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    207    208    208            5           2604    18875    main_image id    DEFAULT     n   ALTER TABLE ONLY public.main_image ALTER COLUMN id SET DEFAULT nextval('public.main_image_id_seq'::regclass);
 <   ALTER TABLE public.main_image ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    204    203    204            8           2604    18916    main_output id    DEFAULT     p   ALTER TABLE ONLY public.main_output ALTER COLUMN id SET DEFAULT nextval('public.main_output_id_seq'::regclass);
 =   ALTER TABLE public.main_output ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    210    209    210            9           2604    18960    main_product id    DEFAULT     r   ALTER TABLE ONLY public.main_product ALTER COLUMN id SET DEFAULT nextval('public.main_product_id_seq'::regclass);
 >   ALTER TABLE public.main_product ALTER COLUMN id DROP DEFAULT;
       public       crackdetectionuser    false    211    212    212             	          0    18738 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       crackdetectionuser    false    192   �       ,	           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       crackdetectionuser    false    191            	          0    18748    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       crackdetectionuser    false    194   -�       -	           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       crackdetectionuser    false    193            �          0    18730    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       crackdetectionuser    false    190   J�       .	           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);
            public       crackdetectionuser    false    189            	          0    18756 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       crackdetectionuser    false    196   �       	          0    18766    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       crackdetectionuser    false    198   ��       /	           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       crackdetectionuser    false    197            0	           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
            public       crackdetectionuser    false    195            	          0    18774    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       crackdetectionuser    false    200   ƿ       1	           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       crackdetectionuser    false    199            
	          0    18834    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       crackdetectionuser    false    202   �       2	           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
            public       crackdetectionuser    false    201            �          0    18720    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       crackdetectionuser    false    188    �       3	           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);
            public       crackdetectionuser    false    187            �          0    18709    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       crackdetectionuser    false    186   ��       4	           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);
            public       crackdetectionuser    false    185            	          0    18969    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       crackdetectionuser    false    213   ��       	          0    18885    main_dataset 
   TABLE DATA               =   COPY public.main_dataset (id, name, description) FROM stdin;
    public       crackdetectionuser    false    206   ��       5	           0    0    main_dataset_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.main_dataset_id_seq', 1, false);
            public       crackdetectionuser    false    205            	          0    18893    main_datasetimage 
   TABLE DATA               E   COPY public.main_datasetimage (id, dataset_id, image_id) FROM stdin;
    public       crackdetectionuser    false    208   ��       6	           0    0    main_datasetimage_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.main_datasetimage_id_seq', 1, false);
            public       crackdetectionuser    false    207            	          0    18872 
   main_image 
   TABLE DATA               4   COPY public.main_image (id, data, name) FROM stdin;
    public       crackdetectionuser    false    204   ��       7	           0    0    main_image_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.main_image_id_seq', 1, false);
            public       crackdetectionuser    false    203            	          0    18913    main_output 
   TABLE DATA               D   COPY public.main_output (id, algorithm, data, image_id) FROM stdin;
    public       crackdetectionuser    false    210   �       8	           0    0    main_output_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.main_output_id_seq', 1, false);
            public       crackdetectionuser    false    209            	          0    18957    main_product 
   TABLE DATA               B   COPY public.main_product (id, title, data, output_id) FROM stdin;
    public       crackdetectionuser    false    212   �       9	           0    0    main_product_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.main_product_id_seq', 1, false);
            public       crackdetectionuser    false    211            G           2606    18745    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         crackdetectionuser    false    192    192            L           2606    18800 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         crackdetectionuser    false    194    194    194            O           2606    18753 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         crackdetectionuser    false    194    194            I           2606    18743    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         crackdetectionuser    false    192    192            B           2606    18786 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         crackdetectionuser    false    190    190    190            D           2606    18735 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         crackdetectionuser    false    190    190            W           2606    18771 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         crackdetectionuser    false    198    198            Z           2606    18815 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         crackdetectionuser    false    198    198    198            Q           2606    18761    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         crackdetectionuser    false    196    196            ]           2606    18779 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         crackdetectionuser    false    200    200            `           2606    18829 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         crackdetectionuser    false    200    200    200            T           2606    18857     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         crackdetectionuser    false    196    196            c           2606    18843 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         crackdetectionuser    false    202    202            =           2606    18727 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         crackdetectionuser    false    188    188    188            ?           2606    18725 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         crackdetectionuser    false    188    188            ;           2606    18717 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         crackdetectionuser    false    186    186            u           2606    18976 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         crackdetectionuser    false    213    213            h           2606    18890    main_dataset main_dataset_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.main_dataset
    ADD CONSTRAINT main_dataset_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.main_dataset DROP CONSTRAINT main_dataset_pkey;
       public         crackdetectionuser    false    206    206            l           2606    18898 (   main_datasetimage main_datasetimage_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.main_datasetimage
    ADD CONSTRAINT main_datasetimage_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.main_datasetimage DROP CONSTRAINT main_datasetimage_pkey;
       public         crackdetectionuser    false    208    208            f           2606    18877    main_image main_image_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.main_image
    ADD CONSTRAINT main_image_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.main_image DROP CONSTRAINT main_image_pkey;
       public         crackdetectionuser    false    204    204            o           2606    18918    main_output main_output_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.main_output
    ADD CONSTRAINT main_output_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.main_output DROP CONSTRAINT main_output_pkey;
       public         crackdetectionuser    false    210    210            r           2606    18962    main_product main_product_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.main_product
    ADD CONSTRAINT main_product_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.main_product DROP CONSTRAINT main_product_pkey;
       public         crackdetectionuser    false    212    212            E           1259    18788    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         crackdetectionuser    false    192            J           1259    18801 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         crackdetectionuser    false    194            M           1259    18802 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         crackdetectionuser    false    194            @           1259    18787 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         crackdetectionuser    false    190            U           1259    18817 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         crackdetectionuser    false    198            X           1259    18816 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         crackdetectionuser    false    198            [           1259    18831 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         crackdetectionuser    false    200            ^           1259    18830 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         crackdetectionuser    false    200            R           1259    18858     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         crackdetectionuser    false    196            a           1259    18854 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         crackdetectionuser    false    202            d           1259    18855 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         crackdetectionuser    false    202            s           1259    18978 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         crackdetectionuser    false    213            v           1259    18977 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         crackdetectionuser    false    213            i           1259    18909 %   main_datasetimage_dataset_id_0b1c4526    INDEX     i   CREATE INDEX main_datasetimage_dataset_id_0b1c4526 ON public.main_datasetimage USING btree (dataset_id);
 9   DROP INDEX public.main_datasetimage_dataset_id_0b1c4526;
       public         crackdetectionuser    false    208            j           1259    18910 #   main_datasetimage_image_id_6199ff40    INDEX     e   CREATE INDEX main_datasetimage_image_id_6199ff40 ON public.main_datasetimage USING btree (image_id);
 7   DROP INDEX public.main_datasetimage_image_id_6199ff40;
       public         crackdetectionuser    false    208            m           1259    18924    main_output_image_id_f6c86e60    INDEX     Y   CREATE INDEX main_output_image_id_f6c86e60 ON public.main_output USING btree (image_id);
 1   DROP INDEX public.main_output_image_id_f6c86e60;
       public         crackdetectionuser    false    210            p           1259    18968    main_product_output_id_cbc58bd4    INDEX     ]   CREATE INDEX main_product_output_id_cbc58bd4 ON public.main_product USING btree (output_id);
 3   DROP INDEX public.main_product_output_id_cbc58bd4;
       public         crackdetectionuser    false    212            y           2606    18794 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       crackdetectionuser    false    190    194    2116            x           2606    18789 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       crackdetectionuser    false    192    194    2121            w           2606    18780 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       crackdetectionuser    false    188    190    2111            {           2606    18809 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       crackdetectionuser    false    198    192    2121            z           2606    18804 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       crackdetectionuser    false    198    196    2129            }           2606    18823 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       crackdetectionuser    false    190    200    2116            |           2606    18818 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       crackdetectionuser    false    200    2129    196            ~           2606    18844 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       crackdetectionuser    false    2111    202    188                       2606    18849 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       crackdetectionuser    false    2129    202    196            �           2606    18940 J   main_datasetimage main_datasetimage_dataset_id_0b1c4526_fk_main_dataset_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_datasetimage
    ADD CONSTRAINT main_datasetimage_dataset_id_0b1c4526_fk_main_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.main_dataset(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.main_datasetimage DROP CONSTRAINT main_datasetimage_dataset_id_0b1c4526_fk_main_dataset_id;
       public       crackdetectionuser    false    206    208    2152            �           2606    18945 F   main_datasetimage main_datasetimage_image_id_6199ff40_fk_main_image_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_datasetimage
    ADD CONSTRAINT main_datasetimage_image_id_6199ff40_fk_main_image_id FOREIGN KEY (image_id) REFERENCES public.main_image(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.main_datasetimage DROP CONSTRAINT main_datasetimage_image_id_6199ff40_fk_main_image_id;
       public       crackdetectionuser    false    208    204    2150            �           2606    18950 :   main_output main_output_image_id_f6c86e60_fk_main_image_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_output
    ADD CONSTRAINT main_output_image_id_f6c86e60_fk_main_image_id FOREIGN KEY (image_id) REFERENCES public.main_image(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.main_output DROP CONSTRAINT main_output_image_id_f6c86e60_fk_main_image_id;
       public       crackdetectionuser    false    2150    210    204            �           2606    18963 >   main_product main_product_output_id_cbc58bd4_fk_main_output_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_product
    ADD CONSTRAINT main_product_output_id_cbc58bd4_fk_main_output_id FOREIGN KEY (output_id) REFERENCES public.main_output(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.main_product DROP CONSTRAINT main_product_output_id_cbc58bd4_fk_main_output_id;
       public       crackdetectionuser    false    210    2159    212             	      x������ � �      	      x������ � �      �   �  x�m�Qn�0@��Sp������1iB%bH �z���۬�~Q���ҼwS��}q���M~}�҄�3�B��������b�"ػ���)kF���g��&��[M�R�Oh���g�AuR�����*ތ�k�uq���m�<�wsʓTP$�H��>
&+	W,�PT��ͦ�:Q����_��!��J	ҲKP���lp�'�Z��3�Pꙁ�"u0Y)�*�<)J�:��F_Ŗ�zs��-
S��wf�3cj�#���Yg�2�w�ۜ/��np�^��Tj��8)�j�'�V��q�Q\Ӽ1��u,Z�'�N����Hy"v"(Be{쟹�΁�_4-0�]`��
����_{$�7cY�~�y^|CbVm����8�	�K/q�� A�G#1<���=��j�!�D��g��%ƞ�!�� � ݺ/      	   �   x�3�,H�NI3�/�H425S142 �po�RK�`�$cS��l}��� ��������*o�T��4?G��p��#K�d��|[�?�����"N (B#CK]c]KC+s+S=CSsKKcm�=... ��";      	      x������ � �      	      x������ � �      
	      x������ � �      �   {   x�U�M
1�ur��{7aƂmJ�,������=�Hʵ4x���Ɔ �'���c�Σ�"OѬC��i6g�u�_��?��B��(����J+�-���� �>܇d_�SXܺ>v��8?j      �   �  x����n� ������U#�3}��F(aS$�j�j��;���
Uz����@w��Ɣ��v�1�8�}�q'�~�}��Yɣa@�f��;���ǄcܰB�Ο�8� QRj�yC8�Ӆ]�q	����O���C<;��!n�ПR�F����^�x��.c8/�軸�G7��;8�!�U�Y�M�����),8�e��;�8��a��W�&ud�0e��V������0��?�pBg���ْ���4�V:��eQ �����5��#��ַfN)�Q�բ)��-.5�;�о���v:͵�7�ǳOӲ�هe�º�Ks�dS�����6���Q��0	�$���%�#��J�a����6�#Ќ]9(�+��ۓ�g�&��6V]{7����cN��$l�$R�~��(��^�UD} �^�s\��qV9�Ӗ�]��H�P	�%��T;�(��䕶_h�Ԕk�VY(����e:o�v�t��sH#ZCy!�Ԅ)j�T�s<�<��      	      x������ � �      	      x������ � �      	      x������ � �      	      x������ � �      	      x������ � �      	      x������ � �     