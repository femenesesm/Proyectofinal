<?php
session_start();
 
class Carrito
{
 
	//aquí guardamos el contenido del carrito
	private $carrito = array();
 
	//seteamos el carrito exista o no exista en el constructor
	public function __construct()
	{
		
		if(!isset($_SESSION["carrito"]))
		{
			$_SESSION["carrito"] = null;
			$this->carrito["precio_total"] = 0;
			$this->carrito["articulos_total"] = 0;
		}
		$this->carrito = $_SESSION['carrito'];
	}
 
	//añadir producto al carrito
	public function add($articulo = array())
	{		
		if(!is_array($articulo) || empty($articulo))
		{
			throw new Exception("Error, el articulo no es un array!", 1);	
		} 
		
		if(!$articulo["id"] || !$articulo["cantidad"] || !$articulo["precio"])
		{
			throw new Exception("Error, el articulo debe tener un id, cantidad y precio!", 1);	
		}
 
		if(!is_numeric($articulo["id"]) || !is_numeric($articulo["cantidad"]) || !is_numeric($articulo["precio"]))
		{
			throw new Exception("Error, el id, cantidad y precio deben ser números!", 1);	
		}
 		
		$unique_id = md5($articulo["id"]);
 
		$articulo["unique_id"] = $unique_id;
		
		if(!empty($this->carrito))
		{
			foreach ($this->carrito as $row) 
			{
				if($row["unique_id"] === $unique_id)
				{
					//sumar cantidad de productos
					$articulo["cantidad"] = $row["cantidad"] + $articulo["cantidad"];
				}
			}
		}
 
	    
	    $articulo["total"] = $articulo["cantidad"] * $articulo["precio"];
 
	    //primero debemos eliminar el producto si es que estaba en el carrito
	    $this->unset_producto($unique_id);
 
	    ///añadir producto al carrito
	    $_SESSION["carrito"][$unique_id] = $articulo;
 
	    //actualizamos el carrito
	    $this->update_carrito();
 
	    //actualizamos el precio total y el número de artículos del carrito
	    //una vez hemos añadido el producto
	    $this->update_precio_cantidad();
 
	}
            //actualiza el precio y la cantidad 
	private function update_precio_cantidad()
	{
		$precio = 0;
		$articulos = 0;
		
		foreach ($this->carrito as $row) 
		{
			$precio += ($row['precio'] * $row['cantidad']);
			$articulos += $row['cantidad'];
		}
 
		$_SESSION['carrito']["articulos_total"] = $articulos;
		$_SESSION['carrito']["precio_total"] = $precio;
 
		$this->update_carrito();
	}
 
	//retorna el precio total
	public function precio_total()
	{
		if(!isset($this->carrito["precio_total"]) || $this->carrito === null)
		{
			return 0;
		}
		if(!is_numeric($this->carrito["precio_total"]))
		{
			throw new Exception("El precio total del carrito debe ser un número", 1);	
		}
		return $this->carrito["precio_total"] ? $this->carrito["precio_total"] : 0;
	}
 
	//retorna cantidad de articulos
	public function articulos_total()
	{
		if(!isset($this->carrito["articulos_total"]) || $this->carrito === null)
		{
			return 0;
		}
		if(!is_numeric($this->carrito["articulos_total"]))
		{
			throw new Exception("El número de artículos del carrito debe ser un número", 1);	
		}
		return $this->carrito["articulos_total"] ? $this->carrito["articulos_total"] : 0;
	}
 
	//retornar contenido de carrito
	public function get_content()
	{
		$carrito = $this->carrito;
		unset($carrito["articulos_total"]);
		unset($carrito["precio_total"]);
		return $carrito == null ? null : $carrito;
	} 
	
 
	//para eliminar un producto debemos pasar la clave única
	//que contiene cada uno de ellos
	public function remove_producto($id)
	{
		if($this->carrito === null)
		{
			throw new Exception("El carrito no existe!", 1);
		}
 
		if(!isset($this->carrito[$id]))
		{
			throw new Exception("La unique_id $id no existe!", 1);
		}
		unset($_SESSION["carrito"][$id]);
		$this->update_carrito();
		$this->update_precio_cantidad();
		return true;
	}
 
	//eliminar contenido
	public function destroy()
	{
		unset($_SESSION["carrito"]);
		$this->carrito = null;
		return true;
	}
 
	//actualizamos carrito
	public function update_carrito()
	{
		self::__construct();
	}
 
}